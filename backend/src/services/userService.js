/**
 * User Service
 * 
 * Handles all user-related business logic
 * Part of the Service Layer in MVC Architecture
 */

const database = require('../patterns/singleton');
const User = require('../models/User');

class UserService {
  /**
   * Register a new user
   * @param {Object} userData - User registration data
   * @returns {Object} Created user or error
   */
  register(userData) {
    // Validate input
    const validation = User.validate(userData);
    if (!validation.isValid) {
      return {
        success: false,
        error: 'Validation failed',
        details: validation.errors
      };
    }

    // Check if user already exists
    const existingUser = database.findUserByEmail(userData.email);
    if (existingUser) {
      return {
        success: false,
        error: 'User with this email already exists'
      };
    }

    // Create new user
    const user = new User(userData);
    database.addUser(user);

    return {
      success: true,
      data: user.toJSON(),
      message: 'User registered successfully'
    };
  }

  /**
   * Login user
   * @param {string} email - User email
   * @param {string} password - User password
   * @returns {Object} User data or error
   */
  login(email, password) {
    if (!email || !password) {
      return {
        success: false,
        error: 'Email and password are required'
      };
    }

    const user = database.findUserByEmail(email);
    
    if (!user) {
      return {
        success: false,
        error: 'User not found'
      };
    }

    // In production, compare hashed passwords
    if (user.password !== password) {
      return {
        success: false,
        error: 'Invalid password'
      };
    }

    // Generate mock token (in production, use JWT)
    const token = `token_${user.id}_${Date.now()}`;

    return {
      success: true,
      data: {
        user: user.toJSON(),
        token
      },
      message: 'Login successful'
    };
  }

  /**
   * Get user profile by ID
   * @param {string} userId - User ID
   * @returns {Object} User profile or error
   */
  getProfile(userId) {
    if (!userId) {
      return {
        success: false,
        error: 'User ID is required'
      };
    }

    const user = database.findUserById(userId);
    
    if (!user) {
      return {
        success: false,
        error: 'User not found'
      };
    }

    return {
      success: true,
      data: user.toJSON()
    };
  }

  /**
   * Get all users (admin only)
   * @returns {Object} List of users
   */
  getAllUsers() {
    const users = database.getUsers();
    return {
      success: true,
      data: users.map(u => new User(u).toJSON()),
      count: users.length
    };
  }

  /**
   * Update user profile
   * @param {string} userId - User ID
   * @param {Object} updates - Fields to update
   * @returns {Object} Updated user or error
   */
  updateProfile(userId, updates) {
    const user = database.findUserById(userId);
    
    if (!user) {
      return {
        success: false,
        error: 'User not found'
      };
    }

    // Update allowed fields only
    const allowedUpdates = ['name', 'email'];
    allowedUpdates.forEach(field => {
      if (updates[field] !== undefined) {
        user[field] = updates[field];
      }
    });
    
    user.updatedAt = new Date().toISOString();

    return {
      success: true,
      data: new User(user).toJSON(),
      message: 'Profile updated successfully'
    };
  }
}

module.exports = new UserService();