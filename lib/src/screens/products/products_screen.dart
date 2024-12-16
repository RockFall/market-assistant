import 'package:flutter/material.dart';
import '../../services/product_service.dart';
import '../../services/database_service.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  static const routeName = '/products';

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductService productService = ProductService(DatabaseService());
  List<Map<String, dynamic>> displayedProducts = [];
  String selectedCategory = 'Todos';

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    await productService.loadMockProducts();
    final products = await productService.getAllProducts();
    setState(() {
      displayedProducts = products;
    });
  }

  Future<void> _filterProducts(String category) async {
    if (category == 'Todos') {
      final products = await productService.getAllProducts();
      setState(() {
        displayedProducts = products;
        selectedCategory = category;
      });
    } else {
      final filteredProducts = await productService.filterProductsByCategory(category);
      setState(() {
        displayedProducts = filteredProducts;
        selectedCategory = category;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const categories = ['Todos', 'Massas', 'Legumes', 'Vegetais'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          DropdownButton<String>(
            value: selectedCategory,
            onChanged: (value) {
              if (value != null) {
                _filterProducts(value);
              }
            },
            items: categories.map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
          ),
          IconButton(
    key: const Key('addProductButton'), // Adicione uma chave aqui
    icon: const Icon(Icons.add),
    onPressed: () {
      // Navega para a tela de adicionar produto
      print("Botão adicionar clicado");
    },
  ),
        ],
      ),
      body: displayedProducts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: displayedProducts.length,
              itemBuilder: (BuildContext context, int index) {
                final product = displayedProducts[index];
                return Card(
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          product['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product['name'],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
