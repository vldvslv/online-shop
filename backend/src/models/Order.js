/**
 * Order Model
 * Represents an order in the system
 */

const crypto = require('crypto');

class Order {
  constructor(data) {
    this.id = data.id || crypto.randomUUID();
    this.userId = data.userId;
    this.items = data.items || []; // Array of { productId, quantity, price }
    this.totalAmount = data.totalAmount || this.calculateTotal();
    this.currency = data.currency || 'USD';
    this.status = data.status || 'pending'; // pending, confirmed, shipped, delivered, cancelled
    this.shippingAddress = data.shippingAddress || {};
    this.paymentMethod = data.paymentMethod || 'card';
    this.paymentStatus = data.paymentStatus || 'pending'; // pending, paid, failed, refunded
    this.notes = data.notes || '';
    this.createdAt = data.createdAt || new Date().toISOString();
    this.updatedAt = new Date().toISOString();
  }

  // Calculate total from items
  calculateTotal() {
    return this.items.reduce((sum, item) => {
      return sum + (item.price * item.quantity);
    }, 0);
  }

  // Convert to JSON
  toJSON() {
    return {
      id: this.id,
      userId: this.userId,
      items: this.items,
      totalAmount: this.totalAmount,
      currency: this.currency,
      status: this.status,
      shippingAddress: this.shippingAddress,
      paymentMethod: this.paymentMethod,
      paymentStatus: this.paymentStatus,
      notes: this.notes,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt
    };
  }

  // Validate order data
  static validate(data) {
    const errors = [];

    if (!data.userId) {
      errors.push('User ID is required');
    }

    if (!data.items || !Array.isArray(data.items) || data.items.length === 0) {
      errors.push('Order must contain at least one item');
    }

    if (data.items) {
      data.items.forEach((item, index) => {
        if (!item.productId) {
          errors.push(`Item ${index + 1}: Product ID is required`);
        }
        if (!item.quantity || item.quantity < 1) {
          errors.push(`Item ${index + 1}: Valid quantity is required`);
        }
      });
    }

    if (!data.shippingAddress || !data.shippingAddress.address) {
      errors.push('Shipping address is required');
    }

    return {
      isValid: errors.length === 0,
      errors
    };
  }

  // Valid status transitions
  static validStatuses = ['pending', 'confirmed', 'shipped', 'delivered', 'cancelled'];

  // Check if status transition is valid
  canTransitionTo(newStatus) {
    const transitions = {
      pending: ['confirmed', 'cancelled'],
      confirmed: ['shipped', 'cancelled'],
      shipped: ['delivered'],
      delivered: [],
      cancelled: []
    };

    return transitions[this.status]?.includes(newStatus) || false;
  }
}

module.exports = Order;