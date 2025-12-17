/**
 * Product Controller
 * 
 * Handles HTTP requests for product-related operations
 * Part of the Controller Layer in MVC Architecture
 */

const productService = require('../services/productService');

class ProductController {
  /**
   * GET /api/products
   * Get all products with optional filters
   */
  getAllProducts(req, res) {
    try {
      const filters = {
        brand: req.query.brand,
        minPrice: req.query.minPrice,
        maxPrice: req.query.maxPrice,
        featured: req.query.featured,
        inStock: req.query.inStock
      };
      
      const result = productService.getAllProducts(filters);
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
   * GET /api/products/featured
   * Get featured products
   */
  getFeaturedProducts(req, res) {
    try {
      const result = productService.getFeaturedProducts();
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
   * GET /api/products/search
   * Search products
   */
  searchProducts(req, res) {
    try {
      const result = productService.searchProducts(req.query.q);
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
   * GET /api/products/:id
   * Get product by ID
   */
  getProductById(req, res) {
    try {
      const result = productService.getProductById(req.params.id);
      
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
   * POST /api/products
   * Create new product (admin)
   */
  createProduct(req, res) {
    try {
      const result = productService.createProduct(req.body);
      
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
   * PUT /api/products/:id
   * Update product (admin)
   */
  updateProduct(req, res) {
    try {
      const result = productService.updateProduct(req.params.id, req.body);
      
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
   * DELETE /api/products/:id
   * Delete product (admin)
   */
  deleteProduct(req, res) {
    try {
      const result = productService.deleteProduct(req.params.id);
      
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

module.exports = new ProductController();