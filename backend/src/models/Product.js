/**
 * Product Model
 * Represents a product (watch) in the system
 */

const crypto = require('crypto');

class Product {
  constructor(data) {
    this.id = data.id || crypto.randomUUID();
    this.name = data.name;
    this.brand = data.brand;
    this.description = data.description || '';
    this.price = data.price;
    this.currency = data.currency || 'USD';
    this.image = data.image || '';
    this.category = data.category || 'watches';
    this.stock = data.stock || 0;
    this.specifications = data.specifications || {};
    this.featured = data.featured || false;
    this.createdAt = data.createdAt || new Date().toISOString();
    this.updatedAt = new Date().toISOString();
  }

  // Convert to JSON
  toJSON() {
    return {
      id: this.id,
      name: this.name,
      brand: this.brand,
      description: this.description,
      price: this.price,
      currency: this.currency,
      image: this.image,
      category: this.category,
      stock: this.stock,
      specifications: this.specifications,
      featured: this.featured,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt
    };
  }

  // Validate product data
  static validate(data) {
    const errors = [];

    if (!data.name || data.name.trim().length < 2) {
      errors.push('Product name must be at least 2 characters');
    }

    if (!data.brand || data.brand.trim().length < 2) {
      errors.push('Brand name is required');
    }

    if (!data.price || data.price <= 0) {
      errors.push('Valid price is required');
    }

    if (data.stock !== undefined && data.stock < 0) {
      errors.push('Stock cannot be negative');
    }

    return {
      isValid: errors.length === 0,
      errors
    };
  }

  // Check if product is in stock
  isInStock() {
    return this.stock > 0;
  }

  // Decrease stock
  decreaseStock(quantity = 1) {
    if (this.stock >= quantity) {
      this.stock -= quantity;
      this.updatedAt = new Date().toISOString();
      return true;
    }
    return false;
  }
}

module.exports = Product;