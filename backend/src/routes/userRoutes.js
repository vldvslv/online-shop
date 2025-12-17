/**
 * User Routes
 * 
 * Defines REST API endpoints for user operations
 */

const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

/**
 * @route   POST /api/users/register
 * @desc    Register a new user
 * @access  Public
 */
router.post('/register', (req, res) => userController.register(req, res));

/**
 * @route   POST /api/users/login
 * @desc    Login user
 * @access  Public
 */
router.post('/login', (req, res) => userController.login(req, res));

/**
 * @route   GET /api/users
 * @desc    Get all users
 * @access  Admin
 */
router.get('/', (req, res) => userController.getAllUsers(req, res));

/**
 * @route   GET /api/users/profile/:id
 * @desc    Get user profile
 * @access  Private
 */
router.get('/profile/:id', (req, res) => userController.getProfile(req, res));

/**
 * @route   PUT /api/users/profile/:id
 * @desc    Update user profile
 * @access  Private
 */
router.put('/profile/:id', (req, res) => userController.updateProfile(req, res));

module.exports = router;