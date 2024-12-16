import 'package:flutter_test/flutter_test.dart';
import 'package:shoppingplanner/src/services/database_service.dart';
import 'package:shoppingplanner/src/services/product_service.dart';
import 'package:shoppingplanner/src/data/mock_products.dart';

void main() {
  late DatabaseService databaseService;
  late ProductService productService;

  setUp(() {
    databaseService = DatabaseService();
    productService = ProductService(databaseService);
  });

  group('ProductService', () {
    test('should load mock products into the database', () async {
      await productService.loadMockProducts();
      final products = await productService.getAllProducts();
      expect(products.length, mockProducts.length);
    });

    test('should retrieve all products from the database', () async {
      await productService.loadMockProducts();
      final products = await productService.getAllProducts();
      expect(products.first['name'], mockProducts.first['name']);
    });

    test('should clear all products from the database', () async {
      await productService.loadMockProducts();
      await productService.clearProducts();
      final products = await productService.getAllProducts();
      expect(products.isEmpty, true);
    });

    test('should have an empty products table by default', () async {
      final products = await productService.getAllProducts();
      expect(products.isEmpty, true);
    });
    test('should filter products by category', () async {
      await productService.loadMockProducts();
      final filteredProducts = await productService.filterProductsByCategory('Massas');
      expect(filteredProducts.first['name'], 'Macarrão Lasanha');
    });
  });
}
