/**
 * Order Controller
 * 
 * Handles HTTP requests for order-related operations
 * Part of the Controller Layer in MVC Architecture
 */

const orderService = require('../services/orderService');

class OrderController {
  /**
   * POST /api/orders
   * Create a new order
   */
  createOrder(req, res) {
    try {
      const result = orderService.createOrder(req.body);
      
      if (result.success) {
        res.status(201).json(result);
      } else {
        res.status(400).json(result);
      }
    } catch (error) {
      res.status(500).json({
        success: false,
        error: 'Internal server error',
        details: error.message
      });
    }
  }

  /**
   * GET /api/orders/:id
   * Get order by ID
   */
  getOrderById(req, res) {
    try {
      const result = orderService.getOrderById(req.params.id);
      
      if (result.success) {
        res.status(200).json(result);
      } else {
        res.status(404).json(result);
      }
    } catch (error) {
      res.status(500).json({
        success: false,
        error: 'Internal server error',
        details: error.message
      });
    }
  }

  /**
   * GET /api/orders/user/:userId
   * Get orders by user ID
   */
  getOrdersByUserId(req, res) {
    try {
      const result = orderService.getOrdersByUserId(req.params.userId);
      res.status(200).json(result);
    } catch (error) {
      res.status(500).json({
        success: false,
        error: 'Internal server error',
        details: error.message
      });
    }
  }

  /**
   * GET /api/orders
   * Get all orders (admin)
   */
  getAllOrders(req, res) {
    try {
      const filters = {
        status: req.query.status,
        paymentStatus: req.query.paymentStatus
      };
      
      const result = orderService.getAllOrders(filters);
      res.status(200).json(result);
    } catch (error) {
      res.status(500).json({
        success: false,
        error: 'Internal server error',
        details: error.message
      });
    }
  }

  /**
   * PUT /api/orders/:id/status
   * Update order status
   */
  updateOrderStatus(req, res) {
    try {
      const { status } = req.body;
      const result = orderService.updateOrderStatus(req.params.id, status);
      
      if (result.success) {
        res.status(200).json(result);
      } else {
        res.status(400).json(result);
      }
    } catch (error) {
      res.status(500).json({
        success: false,
        error: 'Internal server error',
        details: error.message
      });
    }
  }

  /**
   * PUT /api/orders/:id/payment
   * Update payment status
   */
  updatePaymentStatus(req, res) {
    try {
      const { paymentStatus } = req.body;
      const result = orderService.updatePaymentStatus(req.params.id, paymentStatus);
      
      if (result.success) {
        res.status(200).json(result);
      } else {
        res.status(400).json(result);
      }
    } catch (error) {
      res.status(500).json({
        success: false,
        error: 'Internal server error',
        details: error.message
      });
    }
  }

  /**
   * POST /api/orders/:id/cancel
   * Cancel order
   */
  cancelOrder(req, res) {
    try {
      const { userId } = req.body;
      const result = orderService.cancelOrder(req.params.id, userId);
      
      if (result.success) {
        res.status(200).json(result);
      } else {
        res.status(400).json(result);
      }
    } catch (error) {
      res.status(500).json({
        success: false,
        error: 'Internal server error',
        details: error.message
      });
    }
  }

  /**
   * GET /api/orders/statistics
   * Get order statistics (admin)
   */
  getStatistics(req, res) {
    try {
      const result = orderService.getStatistics();
      res.status(200).json(result);
    } catch (error) {
      res.status(500).json({
        success: false,
        error: 'Internal server error',
        details: error.message
      });
    }
  }
}

module.exports = new OrderController();