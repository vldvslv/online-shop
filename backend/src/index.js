/**
 * Main Entry Point
 * 
 * Express.js REST API Server for Chrono Luxe Online Shop
 * 
 * Architecture: MVC (Model-View-Controller)
 * Design Pattern: Singleton (Database)
 * 
 * Services:
 * - User Service: Authentication and user management
 * - Product Service: Product catalog management
 * - Order Service: Order processing and management
 */

const express = require('express');
const cors = require('cors');
require('dotenv').config();

// Import routes
const userRoutes = require('./routes/userRoutes');
const productRoutes = require('./routes/productRoutes');
const orderRoutes = require('./routes/orderRoutes');

// Import singleton database for connection info
const database = require('./patterns/singleton');

// Initialize Express app
const app = express();
const PORT = process.env.PORT || 3000;

// ============================================================================
// MIDDLEWARE
// ============================================================================

// Enable CORS for all origins (for development)
app.use(cors());

// Parse JSON request bodies
app.use(express.json());

// Request logging middleware
app.use((req, res, next) => {
  console.log(`📨 ${new Date().toISOString()} - ${req.method} ${req.path}`);
  next();
});

// ============================================================================
// API ROUTES
// ============================================================================

/**
 * Health check endpoint
 * @route GET /api/health
 */
app.get('/api/health', (req, res) => {
  res.json({
    success: true,
    message: 'Chrono Luxe API is running',
    timestamp: new Date().toISOString(),
    database: database.getConnectionInfo()
  });
});

/**
 * API Info endpoint
 * @route GET /api
 */
app.get('/api', (req, res) => {
  res.json({
    success: true,
    name: 'Chrono Luxe API',
    version: '1.0.0',
    description: 'REST API for luxury watch e-commerce platform',
    endpoints: {
      users: {
        'POST /api/users/register': 'Register new user',
        'POST /api/users/login': 'Login user',
        'GET /api/users': 'Get all users (admin)',
        'GET /api/users/profile/:id': 'Get user profile',
        'PUT /api/users/profile/:id': 'Update user profile'
      },
      products: {
        'GET /api/products': 'Get all products',
        'GET /api/products/featured': 'Get featured products',
        'GET /api/products/search?q=query': 'Search products',
        'GET /api/products/:id': 'Get product by ID',
        'POST /api/products': 'Create product (admin)',
        'PUT /api/products/:id': 'Update product (admin)',
        'DELETE /api/products/:id': 'Delete product (admin)'
      },
      orders: {
        'GET /api/orders': 'Get all orders (admin)',
        'GET /api/orders/statistics': 'Get order statistics (admin)',
        'GET /api/orders/user/:userId': 'Get user orders',
        'GET /api/orders/:id': 'Get order by ID',
        'POST /api/orders': 'Create new order',
        'PUT /api/orders/:id/status': 'Update order status (admin)',
        'PUT /api/orders/:id/payment': 'Update payment status (admin)',
        'POST /api/orders/:id/cancel': 'Cancel order'
      }
    },
    architecture: {
      pattern: 'MVC (Model-View-Controller)',
      designPattern: 'Singleton (Database Connection)',
      services: ['User Service', 'Product Service', 'Order Service']
    }
  });
});

// Mount route handlers
app.use('/api/users', userRoutes);
app.use('/api/products', productRoutes);
app.use('/api/orders', orderRoutes);

// ============================================================================
// ERROR HANDLING
// ============================================================================

// 404 handler
app.use((req, res) => {
  res.status(404).json({
    success: false,
    error: 'Endpoint not found',
    path: req.path,
    method: req.method
  });
});

// Global error handler
app.use((err, req, res, next) => {
  console.error('❌ Error:', err.message);
  res.status(500).json({
    success: false,
    error: 'Internal server error',
    message: err.message
  });
});

// ============================================================================
// START SERVER
// ============================================================================

// Only start server if not in test mode
if (process.env.NODE_ENV !== 'test') {
  app.listen(PORT, () => {
    console.log('═══════════════════════════════════════════════════════════');
    console.log('   🕐 CHRONO LUXE - Luxury Watch E-Commerce API');
    console.log('═══════════════════════════════════════════════════════════');
    console.log(`   🚀 Server running on: http://localhost:${PORT}`);
    console.log(`   📚 API Documentation: http://localhost:${PORT}/api`);
    console.log(`   💚 Health Check: http://localhost:${PORT}/api/health`);
    console.log('═══════════════════════════════════════════════════════════');
    console.log('   📦 Services:');
    console.log('      - User Service:    /api/users');
    console.log('      - Product Service: /api/products');
    console.log('      - Order Service:   /api/orders');
    console.log('═══════════════════════════════════════════════════════════');
  });
}

// Export app for testing
module.exports = app;