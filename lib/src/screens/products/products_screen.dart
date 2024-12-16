import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  static const routeName = '/products';

  @override
  Widget build(BuildContext context) {
    // Mock de dados dos produtos
    final List<Map<String, String>> mockProducts = [
      {'name': 'Macarrão', 'image': 'assets/images/macarrao_lasanha.jpg'},
      {'name': 'Tomate', 'image': 'assets/images/tomate.jpg'},
      {'name': 'Alface', 'image': 'assets/images/alface.jpg'},
      {'name': 'Cebola Branca', 'image': 'assets/images/cebola_branca.jpg'},
    ];

    // Detecta o tamanho da tela
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    final double cardSize = isMobile ? 150 : 200;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navega para a tela de adicionar produto
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isMobile ? 2 : 5, // Define o número de colunas
          crossAxisSpacing: isMobile ? 10 : 30, // Espaçamento entre colunas
          mainAxisSpacing: isMobile ? 10 : 20, // Espaçamento entre linhas
          childAspectRatio: 1, // Proporção do item (largura/altura)
        ),
        itemCount: mockProducts.length,
        itemBuilder: (BuildContext context, int index) {
          final product = mockProducts[index];

          return Card(
            elevation: 5,
            child: InkWell(
              onTap: () {
                // Aqui você pode navegar para a tela de detalhes do produto
                print('Clicou no produto ${product['name']}');
              },
              child: Container(
                width: cardSize,
                height: cardSize,
                constraints: BoxConstraints(
                  maxHeight: cardSize,
                  minHeight: cardSize,
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      product['image']!,
                      fit: BoxFit.cover,
                      width: cardSize,
                      height: cardSize,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product['name']!,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              ),
            ),
          );
        },
      ),
    );
  }
}
