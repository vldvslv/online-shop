/**
 * User Controller
 * 
 * Handles HTTP requests for user-related operations
 * Part of the Controller Layer in MVC Architecture
 */

const userService = require('../services/userService');

class UserController {
  /**
   * POST /api/users/register
   * Register a new user
   */
  register(req, res) {
    try {
      const result = userService.register(req.body);
      
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
   * POST /api/users/login
   * Login user
   */
  login(req, res) {
    try {
      const { email, password } = req.body;
      const result = userService.login(email, password);
      
      if (result.success) {
        res.status(200).json(result);
      } else {
        res.status(401).json(result);
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
   * GET /api/users/profile/:id
   * Get user profile
   */
  getProfile(req, res) {
    try {
      const result = userService.getProfile(req.params.id);
      
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
   * GET /api/users
   * Get all users (admin)
   */
  getAllUsers(req, res) {
    try {
      const result = userService.getAllUsers();
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
   * PUT /api/users/profile/:id
   * Update user profile
   */
  updateProfile(req, res) {
    try {
      const result = userService.updateProfile(req.params.id, req.body);
      
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
}

module.exports = new UserController();