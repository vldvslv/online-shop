/**
 * API Unit Tests
 * 
 * Testing the REST API endpoints using Jest and Supertest
 * 
 * Test Coverage:
 * - User Service Tests
 * - Product Service Tests
 * - Order Service Tests
 * - Singleton Pattern Tests
 */

const request = require('supertest');
const app = require('../src/index');
const database = require('../src/patterns/singleton');
const productService = require('../src/services/productService');

// Reset database before each test
beforeEach(() => {
  database.reset();
  // Re-initialize sample products after reset
  productService.initializeSampleProducts();
});

// ============================================================================
// SINGLETON PATTERN TESTS
// ============================================================================

describe('Singleton Pattern', () => {
  test('should return the same database instance', () => {
    const instance1 = require('../src/patterns/singleton');
    const instance2 = require('../src/patterns/singleton');
    
    expect(instance1).toBe(instance2);
  });

  test('should maintain data across the same instance', () => {
    database.addUser({ id: 'test-1', email: 'test@test.com', name: 'Test' });
    const users = database.getUsers();
    
    expect(users.length).toBe(1);
    expect(users[0].email).toBe('test@test.com');
  });
});

// ============================================================================
// USER SERVICE TESTS
// ============================================================================

describe('User API', () => {
  describe('POST /api/users/register', () => {
    test('should register a new user', async () => {
      const res = await request(app)
        .post('/api/users/register')
        .send({
          email: 'john@example.com',
          password: 'password123',
          name: 'John Doe'
        });

      expect(res.status).toBe(201);
      expect(res.body.success).toBe(true);
      expect(res.body.data.email).toBe('john@example.com');
      expect(res.body.data.name).toBe('John Doe');
      expect(res.body.data).not.toHaveProperty('password');
    });

    test('should fail with invalid email', async () => {
      const res = await request(app)
        .post('/api/users/register')
        .send({
          email: 'invalid-email',
          password: 'password123',
          name: 'John Doe'
        });

      expect(res.status).toBe(400);
      expect(res.body.success).toBe(false);
    });

    test('should fail with short password', async () => {
      const res = await request(app)
        .post('/api/users/register')
        .send({
          email: 'john@example.com',
          password: '123',
          name: 'John Doe'
        });

      expect(res.status).toBe(400);
      expect(res.body.success).toBe(false);
    });

    test('should not allow duplicate emails', async () => {
      // Register first user
      await request(app)
        .post('/api/users/register')
        .send({
          email: 'john@example.com',
          password: 'password123',
          name: 'John Doe'
        });

      // Try to register with same email
      const res = await request(app)
        .post('/api/users/register')
        .send({
          email: 'john@example.com',
          password: 'password456',
          name: 'John Smith'
        });

      expect(res.status).toBe(400);
      expect(res.body.success).toBe(false);
      expect(res.body.error).toContain('already exists');
    });
  });

  describe('POST /api/users/login', () => {
    beforeEach(async () => {
      await request(app)
        .post('/api/users/register')
        .send({
          email: 'john@example.com',
          password: 'password123',
          name: 'John Doe'
        });
    });

    test('should login with correct credentials', async () => {
      const res = await request(app)
        .post('/api/users/login')
        .send({
          email: 'john@example.com',
          password: 'password123'
        });

      expect(res.status).toBe(200);
      expect(res.body.success).toBe(true);
      expect(res.body.data).toHaveProperty('token');
      expect(res.body.data.user.email).toBe('john@example.com');
    });

    test('should fail with wrong password', async () => {
      const res = await request(app)
        .post('/api/users/login')
        .send({
          email: 'john@example.com',
          password: 'wrongpassword'
        });

      expect(res.status).toBe(401);
      expect(res.body.success).toBe(false);
    });

    test('should fail with non-existent user', async () => {
      const res = await request(app)
        .post('/api/users/login')
        .send({
          email: 'nobody@example.com',
          password: 'password123'
        });

      expect(res.status).toBe(401);
      expect(res.body.success).toBe(false);
    });
  });
});

// ============================================================================
// PRODUCT SERVICE TESTS
// ============================================================================

describe('Product API', () => {
  describe('GET /api/products', () => {
    test('should return all products', async () => {
      const res = await request(app).get('/api/products');

      expect(res.status).toBe(200);
      expect(res.body.success).toBe(true);
      expect(Array.isArray(res.body.data)).toBe(true);
      expect(res.body.data.length).toBeGreaterThan(0);
    });

    test('should filter products by brand', async () => {
      const res = await request(app)
        .get('/api/products')
        .query({ brand: 'Rolex' });

      expect(res.status).toBe(200);
      expect(res.body.success).toBe(true);
      res.body.data.forEach(product => {
        expect(product.brand.toLowerCase()).toContain('rolex');
      });
    });

    test('should filter products by price range', async () => {
      const res = await request(app)
        .get('/api/products')
        .query({ minPrice: 10000, maxPrice: 20000 });

      expect(res.status).toBe(200);
      expect(res.body.success).toBe(true);
      res.body.data.forEach(product => {
        expect(product.price).toBeGreaterThanOrEqual(10000);
        expect(product.price).toBeLessThanOrEqual(20000);
      });
    });
  });

  describe('GET /api/products/featured', () => {
    test('should return featured products', async () => {
      const res = await request(app).get('/api/products/featured');

      expect(res.status).toBe(200);
      expect(res.body.success).toBe(true);
      res.body.data.forEach(product => {
        expect(product.featured).toBe(true);
      });
    });
  });

  describe('GET /api/products/search', () => {
    test('should search products by name', async () => {
      const res = await request(app)
        .get('/api/products/search')
        .query({ q: 'Rolex' });

      expect(res.status).toBe(200);
      expect(res.body.success).toBe(true);
      expect(res.body.data.length).toBeGreaterThan(0);
    });
  });

  describe('POST /api/products', () => {
    test('should create a new product', async () => {
      const res = await request(app)
        .post('/api/products')
        .send({
          name: 'Test Watch',
          brand: 'Test Brand',
          price: 9999,
          stock: 10
        });

      expect(res.status).toBe(201);
      expect(res.body.success).toBe(true);
      expect(res.body.data.name).toBe('Test Watch');
      expect(res.body.data.price).toBe(9999);
    });

    test('should fail without required fields', async () => {
      const res = await request(app)
        .post('/api/products')
        .send({
          name: 'Test Watch'
        });

      expect(res.status).toBe(400);
      expect(res.body.success).toBe(false);
    });
  });
});

// ============================================================================
// ORDER SERVICE TESTS
// ============================================================================

describe('Order API', () => {
  let userId;
  let productId;

  beforeEach(async () => {
    // Create a test user
    const userRes = await request(app)
      .post('/api/users/register')
      .send({
        email: 'buyer@example.com',
        password: 'password123',
        name: 'Buyer'
      });
    userId = userRes.body.data.id;

    // Get a product ID
    const productsRes = await request(app).get('/api/products');
    productId = productsRes.body.data[0].id;
  });

  describe('POST /api/orders', () => {
    test('should create a new order', async () => {
      const res = await request(app)
        .post('/api/orders')
        .send({
          userId,
          items: [
            { productId, quantity: 1 }
          ],
          shippingAddress: {
            address: '123 Main St',
            city: 'New York',
            country: 'USA'
          }
        });

      expect(res.status).toBe(201);
      expect(res.body.success).toBe(true);
      expect(res.body.data.userId).toBe(userId);
      expect(res.body.data.status).toBe('pending');
      expect(res.body.data.items.length).toBe(1);
    });

    test('should fail without items', async () => {
      const res = await request(app)
        .post('/api/orders')
        .send({
          userId,
          items: [],
          shippingAddress: {
            address: '123 Main St'
          }
        });

      expect(res.status).toBe(400);
      expect(res.body.success).toBe(false);
    });

    test('should fail with invalid user', async () => {
      const res = await request(app)
        .post('/api/orders')
        .send({
          userId: 'invalid-user-id',
          items: [
            { productId, quantity: 1 }
          ],
          shippingAddress: {
            address: '123 Main St'
          }
        });

      expect(res.status).toBe(400);
      expect(res.body.success).toBe(false);
    });
  });

  describe('GET /api/orders/user/:userId', () => {
    test('should return user orders', async () => {
      // Create an order first
      await request(app)
        .post('/api/orders')
        .send({
          userId,
          items: [{ productId, quantity: 1 }],
          shippingAddress: { address: '123 Main St' }
        });

      const res = await request(app)
        .get(`/api/orders/user/${userId}`);

      expect(res.status).toBe(200);
      expect(res.body.success).toBe(true);
      expect(res.body.data.length).toBeGreaterThan(0);
    });
  });
});

// ============================================================================
// HEALTH CHECK TEST
// ============================================================================

describe('Health Check', () => {
  test('GET /api/health should return health status', async () => {
    const res = await request(app).get('/api/health');

    expect(res.status).toBe(200);
    expect(res.body.success).toBe(true);
    expect(res.body.database.connected).toBe(true);
  });

  test('GET /api should return API info', async () => {
    const res = await request(app).get('/api');

    expect(res.status).toBe(200);
    expect(res.body.success).toBe(true);
    expect(res.body.name).toBe('Chrono Luxe API');
    expect(res.body.endpoints).toHaveProperty('users');
    expect(res.body.endpoints).toHaveProperty('products');
    expect(res.body.endpoints).toHaveProperty('orders');
  });
});

// ============================================================================
// 404 TEST
// ============================================================================

describe('404 Handler', () => {
  test('should return 404 for unknown routes', async () => {
    const res = await request(app).get('/api/unknown-endpoint');

    expect(res.status).toBe(404);
    expect(res.body.success).toBe(false);
  });
});