/**
 * Order Routes
 * 
 * Defines REST API endpoints for order operations
 */

const express = require('express');
const router = express.Router();
const orderController = require('../controllers/orderController');

/**
 * @route   GET /api/orders
 * @desc    Get all orders
 * @access  Admin
 * @query   status, paymentStatus
 */
router.get('/', (req, res) => orderController.getAllOrders(req, res));

/**
 * @route   GET /api/orders/statistics
 * @desc    Get order statistics
 * @access  Admin
 */
router.get('/statistics', (req, res) => orderController.getStatistics(req, res));

/**
 * @route   GET /api/orders/user/:userId
 * @desc    Get orders by user ID
 * @access  Private
 */
router.get('/user/:userId', (req, res) => orderController.getOrdersByUserId(req, res));

/**
 * @route   GET /api/orders/:id
 * @desc    Get order by ID
 * @access  Private
 */
router.get('/:id', (req, res) => orderController.getOrderById(req, res));

/**
 * @route   POST /api/orders
 * @desc    Create new order
 * @access  Private
 */
router.post('/', (req, res) => orderController.createOrder(req, res));

/**
 * @route   PUT /api/orders/:id/status
 * @desc    Update order status
 * @access  Admin
 */
router.put('/:id/status', (req, res) => orderController.updateOrderStatus(req, res));

/**
 * @route   PUT /api/orders/:id/payment
 * @desc    Update payment status
 * @access  Admin
 */
router.put('/:id/payment', (req, res) => orderController.updatePaymentStatus(req, res));

/**
 * @route   POST /api/orders/:id/cancel
 * @desc    Cancel order
 * @access  Private
 */
router.post('/:id/cancel', (req, res) => orderController.cancelOrder(req, res));

module.exports = router;