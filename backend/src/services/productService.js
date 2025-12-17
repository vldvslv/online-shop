/**
 * Product Service
 * 
 * Handles all product-related business logic
 * Part of the Service Layer in MVC Architecture
 */

const database = require('../patterns/singleton');
const Product = require('../models/Product');

class ProductService {
  constructor() {
    // Initialize with sample products (watches)
    this.initializeSampleProducts();
  }

  /**
   * Initialize sample products for demonstration
   */
  initializeSampleProducts() {
    const sampleProducts = [
      {
        name: 'Patek Philippe Calatrava',
        brand: 'Patek Philippe',
        description: 'The epitome of dress watches, featuring a timeless design with exceptional craftsmanship.',
        price: 24500,
        image: 'watch1.jpg',
        stock: 3,
        featured: true,
        specifications: {
          movement: 'Automatic',
          case: '39mm White Gold',
          waterResistance: '30m',
          crystal: 'Sapphire'
        }
      },
      {
        name: 'Rolex Submariner',
        brand: 'Rolex',
        description: 'The iconic diving watch that defined the genre, built for performance and style.',
        price: 12800,
        image: 'watch2.jpg',
        stock: 5,
        featured: true,
        specifications: {
          movement: 'Automatic',
          case: '41mm Stainless Steel',
          waterResistance: '300m',
          crystal: 'Sapphire'
        }
      },
      {
        name: 'Omega Seamaster',
        brand: 'Omega',
        description: 'Professional diving watch with legendary heritage and cutting-edge technology.',
        price: 6200,
        image: 'watch3.jpg',
        stock: 8,
        featured: true,
        specifications: {
          movement: 'Co-Axial Automatic',
          case: '42mm Stainless Steel',
          waterResistance: '300m',
          crystal: 'Sapphire'
        }
      },
      {
        name: 'Audemars Piguet Royal Oak',
        brand: 'Audemars Piguet',
        description: 'Revolutionary luxury sports watch with iconic octagonal bezel design.',
        price: 32000,
        image: 'watch4.jpg',
        stock: 2,
        featured: true,
        specifications: {
          movement: 'Automatic',
          case: '41mm Stainless Steel',
          waterResistance: '50m',
          crystal: 'Sapphire'
        }
      },
      {
        name: 'Cartier Tank Française',
        brand: 'Cartier',
        description: 'Elegant rectangular timepiece with Art Deco-inspired design.',
        price: 8900,
        image: 'watch5.jpg',
        stock: 4,
        featured: false,
        specifications: {
          movement: 'Quartz',
          case: '32mm Stainless Steel',
          waterResistance: '30m',
          crystal: 'Sapphire'
        }
      },
      {
        name: 'IWC Portugieser',
        brand: 'IWC',
        description: 'Classic dress watch known for its clean dial and precision movement.',
        price: 9400,
        image: 'watch6.jpg',
        stock: 6,
        featured: false,
        specifications: {
          movement: 'Automatic',
          case: '41mm Stainless Steel',
          waterResistance: '30m',
          crystal: 'Sapphire'
        }
      },
      {
        name: 'Jaeger-LeCoultre Reverso',
        brand: 'Jaeger-LeCoultre',
        description: 'Iconic reversible case watch with Art Deco elegance.',
        price: 11200,
        image: 'watch7.jpg',
        stock: 3,
        featured: false,
        specifications: {
          movement: 'Manual',
          case: '42mm Stainless Steel',
          waterResistance: '30m',
          crystal: 'Sapphire'
        }
      },
      {
        name: 'Vacheron Constantin Patrimony',
        brand: 'Vacheron Constantin',
        description: 'Ultra-thin dress watch representing the pinnacle of haute horlogerie.',
        price: 28500,
        image: 'watch8.jpg',
        stock: 2,
        featured: true,
        specifications: {
          movement: 'Manual',
          case: '40mm White Gold',
          waterResistance: '30m',
          crystal: 'Sapphire'
        }
      }
    ];

    // Only add if database is empty
    if (database.getProducts().length === 0) {
      sampleProducts.forEach(p => {
        const product = new Product(p);
        database.addProduct(product);
      });
      console.log('📦 Sample products initialized');
    }
  }

  /**
   * Get all products
   * @param {Object} filters - Optional filters (brand, minPrice, maxPrice, featured)
   * @returns {Object} List of products
   */
  getAllProducts(filters = {}) {
    let products = database.getProducts();

    // Apply filters
    if (filters.brand) {
      products = products.filter(p => 
        p.brand.toLowerCase().includes(filters.brand.toLowerCase())
      );
    }

    if (filters.minPrice) {
      products = products.filter(p => p.price >= parseFloat(filters.minPrice));
    }

    if (filters.maxPrice) {
      products = products.filter(p => p.price <= parseFloat(filters.maxPrice));
    }

    if (filters.featured !== undefined) {
      products = products.filter(p => p.featured === (filters.featured === 'true'));
    }

    if (filters.inStock === 'true') {
      products = products.filter(p => p.stock > 0);
    }

    return {
      success: true,
      data: products.map(p => new Product(p).toJSON()),
      count: products.length
    };
  }

  /**
   * Get product by ID
   * @param {string} productId - Product ID
   * @returns {Object} Product or error
   */
  getProductById(productId) {
    if (!productId) {
      return {
        success: false,
        error: 'Product ID is required'
      };
    }

    const product = database.findProductById(productId);
    
    if (!product) {
      return {
        success: false,
        error: 'Product not found'
      };
    }

    return {
      success: true,
      data: new Product(product).toJSON()
    };
  }

  /**
   * Create new product (admin only)
   * @param {Object} productData - Product data
   * @returns {Object} Created product or error
   */
  createProduct(productData) {
    const validation = Product.validate(productData);
    if (!validation.isValid) {
      return {
        success: false,
        error: 'Validation failed',
        details: validation.errors
      };
    }

    const product = new Product(productData);
    database.addProduct(product);

    return {
      success: true,
      data: product.toJSON(),
      message: 'Product created successfully'
    };
  }

  /**
   * Update product (admin only)
   * @param {string} productId - Product ID
   * @param {Object} updates - Fields to update
   * @returns {Object} Updated product or error
   */
  updateProduct(productId, updates) {
    const product = database.findProductById(productId);
    
    if (!product) {
      return {
        success: false,
        error: 'Product not found'
      };
    }

    const updatedProduct = database.updateProduct(productId, {
      ...updates,
      updatedAt: new Date().toISOString()
    });

    return {
      success: true,
      data: new Product(updatedProduct).toJSON(),
      message: 'Product updated successfully'
    };
  }

  /**
   * Delete product (admin only)
   * @param {string} productId - Product ID
   * @returns {Object} Success or error
   */
  deleteProduct(productId) {
    const product = database.findProductById(productId);
    
    if (!product) {
      return {
        success: false,
        error: 'Product not found'
      };
    }

    database.deleteProduct(productId);

    return {
      success: true,
      message: 'Product deleted successfully'
    };
  }

  /**
   * Get featured products
   * @returns {Object} List of featured products
   */
  getFeaturedProducts() {
    const products = database.getProducts().filter(p => p.featured);
    
    return {
      success: true,
      data: products.map(p => new Product(p).toJSON()),
      count: products.length
    };
  }

  /**
   * Search products
   * @param {string} query - Search query
   * @returns {Object} List of matching products
   */
  searchProducts(query) {
    if (!query) {
      return this.getAllProducts();
    }

    const lowerQuery = query.toLowerCase();
    const products = database.getProducts().filter(p => 
      p.name.toLowerCase().includes(lowerQuery) ||
      p.brand.toLowerCase().includes(lowerQuery) ||
      p.description.toLowerCase().includes(lowerQuery)
    );

    return {
      success: true,
      data: products.map(p => new Product(p).toJSON()),
      count: products.length,
      query
    };
  }
}

module.exports = new ProductService();