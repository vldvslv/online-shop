/**
 * Order Service
 * 
 * Handles all order-related business logic
 * Part of the Service Layer in MVC Architecture
 */

const database = require('../patterns/singleton');
const Order = require('../models/Order');

class OrderService {
  /**
   * Create a new order
   * @param {Object} orderData - Order data
   * @returns {Object} Created order or error
   */
  createOrder(orderData) {
    // Validate input
    const validation = Order.validate(orderData);
    if (!validation.isValid) {
      return {
        success: false,
        error: 'Validation failed',
        details: validation.errors
      };
    }

    // Verify user exists
    const user = database.findUserById(orderData.userId);
    if (!user) {
      return {
        success: false,
        error: 'User not found'
      };
    }

    // Verify products and calculate total
    let totalAmount = 0;
    const processedItems = [];

    for (const item of orderData.items) {
      const product = database.findProductById(item.productId);
      
      if (!product) {
        return {
          success: false,
          error: `Product not found: ${item.productId}`
        };
      }

      if (product.stock < item.quantity) {
        return {
          success: false,
          error: `Insufficient stock for ${product.name}. Available: ${product.stock}`
        };
      }

      // Add price from product
      processedItems.push({
        productId: item.productId,
        productName: product.name,
        quantity: item.quantity,
        price: product.price,
        subtotal: product.price * item.quantity
      });

      totalAmount += product.price * item.quantity;

      // Decrease stock
      product.stock -= item.quantity;
      database.updateProduct(product.id, { stock: product.stock });
    }

    // Create order
    const order = new Order({
      ...orderData,
      items: processedItems,
      totalAmount,
      status: 'pending',
      paymentStatus: 'pending'
    });

    database.addOrder(order);

    return {
      success: true,
      data: order.toJSON(),
      message: 'Order created successfully'
    };
  }

  /**
   * Get order by ID
   * @param {string} orderId - Order ID
   * @returns {Object} Order or error
   */
  getOrderById(orderId) {
    if (!orderId) {
      return {
        success: false,
        error: 'Order ID is required'
      };
    }

    const order = database.findOrderById(orderId);
    
    if (!order) {
      return {
        success: false,
        error: 'Order not found'
      };
    }

    return {
      success: true,
      data: new Order(order).toJSON()
    };
  }

  /**
   * Get orders by user ID
   * @param {string} userId - User ID
   * @returns {Object} List of orders
   */
  getOrdersByUserId(userId) {
    if (!userId) {
      return {
        success: false,
        error: 'User ID is required'
      };
    }

    const orders = database.findOrdersByUserId(userId);

    return {
      success: true,
      data: orders.map(o => new Order(o).toJSON()),
      count: orders.length
    };
  }

  /**
   * Get all orders (admin only)
   * @param {Object} filters - Optional filters
   * @returns {Object} List of orders
   */
  getAllOrders(filters = {}) {
    let orders = database.getOrders();

    // Apply filters
    if (filters.status) {
      orders = orders.filter(o => o.status === filters.status);
    }

    if (filters.paymentStatus) {
      orders = orders.filter(o => o.paymentStatus === filters.paymentStatus);
    }

    // Sort by date (newest first)
    orders.sort((a, b) => new Date(b.createdAt) - new Date(a.createdAt));

    return {
      success: true,
      data: orders.map(o => new Order(o).toJSON()),
      count: orders.length
    };
  }

  /**
   * Update order status
   * @param {string} orderId - Order ID
   * @param {string} status - New status
   * @returns {Object} Updated order or error
   */
  updateOrderStatus(orderId, status) {
    const order = database.findOrderById(orderId);
    
    if (!order) {
      return {
        success: false,
        error: 'Order not found'
      };
    }

    // Validate status
    if (!Order.validStatuses.includes(status)) {
      return {
        success: false,
        error: `Invalid status. Valid statuses: ${Order.validStatuses.join(', ')}`
      };
    }

    // Check if transition is valid
    const orderInstance = new Order(order);
    if (!orderInstance.canTransitionTo(status)) {
      return {
        success: false,
        error: `Cannot transition from ${order.status} to ${status}`
      };
    }

    // Update status
    const updatedOrder = database.updateOrderStatus(orderId, status);

    return {
      success: true,
      data: new Order(updatedOrder).toJSON(),
      message: `Order status updated to ${status}`
    };
  }

  /**
   * Update payment status
   * @param {string} orderId - Order ID
   * @param {string} paymentStatus - New payment status
   * @returns {Object} Updated order or error
   */
  updatePaymentStatus(orderId, paymentStatus) {
    const order = database.findOrderById(orderId);
    
    if (!order) {
      return {
        success: false,
        error: 'Order not found'
      };
    }

    const validPaymentStatuses = ['pending', 'paid', 'failed', 'refunded'];
    if (!validPaymentStatuses.includes(paymentStatus)) {
      return {
        success: false,
        error: `Invalid payment status. Valid statuses: ${validPaymentStatuses.join(', ')}`
      };
    }

    order.paymentStatus = paymentStatus;
    order.updatedAt = new Date().toISOString();

    // If paid, confirm the order
    if (paymentStatus === 'paid' && order.status === 'pending') {
      order.status = 'confirmed';
    }

    return {
      success: true,
      data: new Order(order).toJSON(),
      message: `Payment status updated to ${paymentStatus}`
    };
  }

  /**
   * Cancel order
   * @param {string} orderId - Order ID
   * @param {string} userId - User ID (for verification)
   * @returns {Object} Cancelled order or error
   */
  cancelOrder(orderId, userId) {
    const order = database.findOrderById(orderId);
    
    if (!order) {
      return {
        success: false,
        error: 'Order not found'
      };
    }

    // Verify ownership
    if (order.userId !== userId) {
      return {
        success: false,
        error: 'Unauthorized to cancel this order'
      };
    }

    // Check if order can be cancelled
    if (!['pending', 'confirmed'].includes(order.status)) {
      return {
        success: false,
        error: 'Order cannot be cancelled at this stage'
      };
    }

    // Restore stock
    for (const item of order.items) {
      const product = database.findProductById(item.productId);
      if (product) {
        product.stock += item.quantity;
        database.updateProduct(product.id, { stock: product.stock });
      }
    }

    // Update order status
    order.status = 'cancelled';
    order.updatedAt = new Date().toISOString();

    return {
      success: true,
      data: new Order(order).toJSON(),
      message: 'Order cancelled successfully'
    };
  }

  /**
   * Get order statistics (admin only)
   * @returns {Object} Order statistics
   */
  getStatistics() {
    const orders = database.getOrders();
    
    const stats = {
      totalOrders: orders.length,
      totalRevenue: orders
        .filter(o => o.paymentStatus === 'paid')
        .reduce((sum, o) => sum + o.totalAmount, 0),
      ordersByStatus: {},
      ordersByPaymentStatus: {}
    };

    // Count by status
    Order.validStatuses.forEach(status => {
      stats.ordersByStatus[status] = orders.filter(o => o.status === status).length;
    });

    // Count by payment status
    ['pending', 'paid', 'failed', 'refunded'].forEach(status => {
      stats.ordersByPaymentStatus[status] = orders.filter(o => o.paymentStatus === status).length;
    });

    return {
      success: true,
      data: stats
    };
  }
}

module.exports = new OrderService();