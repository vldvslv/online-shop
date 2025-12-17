/**
 * Product Routes
 * 
 * Defines REST API endpoints for product operations
 */

const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');

/**
 * @route   GET /api/products
 * @desc    Get all products with optional filters
 * @access  Public
 * @query   brand, minPrice, maxPrice, featured, inStock
 */
router.get('/', (req, res) => productController.getAllProducts(req, res));

/**
 * @route   GET /api/products/featured
 * @desc    Get featured products
 * @access  Public
 */
router.get('/featured', (req, res) => productController.getFeaturedProducts(req, res));

/**
 * @route   GET /api/products/search
 * @desc    Search products
 * @access  Public
 * @query   q (search query)
 */
router.get('/search', (req, res) => productController.searchProducts(req, res));

/**
 * @route   GET /api/products/:id
 * @desc    Get product by ID
 * @access  Public
 */
router.get('/:id', (req, res) => productController.getProductById(req, res));

/**
 * @route   POST /api/products
 * @desc    Create new product
 * @access  Admin
 */
router.post('/', (req, res) => productController.createProduct(req, res));

/**
 * @route   PUT /api/products/:id
 * @desc    Update product
 * @access  Admin
 */
router.put('/:id', (req, res) => productController.updateProduct(req, res));

/**
 * @route   DELETE /api/products/:id
 * @desc    Delete product
 * @access  Admin
 */
router.delete('/:id', (req, res) => productController.deleteProduct(req, res));

module.exports = router;