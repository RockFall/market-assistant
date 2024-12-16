import '../data/mock_products.dart';
import 'database_service.dart';

class ProductService {
  final DatabaseService _databaseService;

  ProductService(this._databaseService);

  Future<void> loadMockProducts() async {
    for (var product in mockProducts) {
      await _databaseService.insertData('products', product);
    }
  }

  Future<List<Map<String, dynamic>>> getAllProducts() async {
    return _databaseService.getData('products');
  }

  Future<void> clearProducts() async {
    await _databaseService.clearTable('products');
  }

  Future<List<Map<String, dynamic>>> filterProductsByCategory(String category) async {
    final products = await getAllProducts();
    return products.where((product) => product['category'] == category).toList();
  }
}
