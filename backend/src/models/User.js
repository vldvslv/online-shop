/**
 * User Model
 * Represents a user in the system
 */

const crypto = require('crypto');

class User {
  constructor(data) {
    this.id = data.id || crypto.randomUUID();
    this.email = data.email;
    this.password = data.password; // In production, this should be hashed
    this.name = data.name;
    this.role = data.role || 'customer'; // customer, admin
    this.createdAt = data.createdAt || new Date().toISOString();
    this.updatedAt = new Date().toISOString();
  }

  // Convert to JSON (without sensitive data)
  toJSON() {
    return {
      id: this.id,
      email: this.email,
      name: this.name,
      role: this.role,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt
    };
  }

  // Validate user data
  static validate(data) {
    const errors = [];

    if (!data.email || !data.email.includes('@')) {
      errors.push('Valid email is required');
    }

    if (!data.password || data.password.length < 6) {
      errors.push('Password must be at least 6 characters');
    }

    if (!data.name || data.name.trim().length < 2) {
      errors.push('Name must be at least 2 characters');
    }

    return {
      isValid: errors.length === 0,
      errors
    };
  }
}

module.exports = User;