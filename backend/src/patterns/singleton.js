/**
 * Singleton Pattern Implementation
 * 
 * This pattern ensures that a class has only one instance
 * and provides a global point of access to it.
 * 
 * Used for: Database connection management
 * 
 * Benefits:
 * - Single database connection instance across the application
 * - Controlled access to shared resource
 * - Lazy initialization
 */

class Database {
  constructor() {
    if (Database.instance) {
      return Database.instance;
    }
    
    // Simulated database storage (in-memory)
    this.users = [];
    this.products = [];
    this.orders = [];
    this.connectionTime = new Date();
    
    // Store the instance
    Database.instance = this;
    
    console.log('📦 Database Singleton instance created at:', this.connectionTime);
  }

  // Get connection info
  getConnectionInfo() {
    return {
      connected: true,
      connectionTime: this.connectionTime,
      collections: {
        users: this.users.length,
        products: this.products.length,
        orders: this.orders.length
      }
    };
  }

  // Users collection methods
  getUsers() {
    return this.users;
  }

  addUser(user) {
    this.users.push(user);
    return user;
  }

  findUserByEmail(email) {
    return this.users.find(u => u.email === email);
  }

  findUserById(id) {
    return this.users.find(u => u.id === id);
  }

  // Products collection methods
  getProducts() {
    return this.products;
  }

  addProduct(product) {
    this.products.push(product);
    return product;
  }

  findProductById(id) {
    return this.products.find(p => p.id === id);
  }

  updateProduct(id, updates) {
    const index = this.products.findIndex(p => p.id === id);
    if (index !== -1) {
      this.products[index] = { ...this.products[index], ...updates };
      return this.products[index];
    }
    return null;
  }

  deleteProduct(id) {
    const index = this.products.findIndex(p => p.id === id);
    if (index !== -1) {
      return this.products.splice(index, 1)[0];
    }
    return null;
  }

  // Orders collection methods
  getOrders() {
    return this.orders;
  }

  addOrder(order) {
    this.orders.push(order);
    return order;
  }

  findOrderById(id) {
    return this.orders.find(o => o.id === id);
  }

  findOrdersByUserId(userId) {
    return this.orders.filter(o => o.userId === userId);
  }

  updateOrderStatus(id, status) {
    const order = this.findOrderById(id);
    if (order) {
      order.status = status;
      order.updatedAt = new Date().toISOString();
      return order;
    }
    return null;
  }

  // Reset database (for testing)
  reset() {
    this.users.length = 0;
    this.products.length = 0;
    this.orders.length = 0;
    console.log('🔄 Database reset');
  }
}

// Export singleton instance
const database = new Database();

module.exports = database;