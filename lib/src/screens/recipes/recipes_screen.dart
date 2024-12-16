import 'package:flutter/material.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  static const routeName = '/recipes';

  @override
  Widget build(BuildContext context) {
    // Mock de dados das receitas
    final List<Map<String, String>> mockRecipes = [
      {'name': 'Bolo de Chocolate', 'image': 'assets/images/bolo_chocolate.jpg'},
      {'name': 'Lasanha', 'image': 'assets/images/lasanha.jpg'},
      {'name': 'Salada Caesar', 'image': 'assets/images/salada_caesar.jpg'},
      {'name': 'Sopa de Legumes', 'image': 'assets/images/sopa_legumes.jpeg'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navega para a tela de adicionar receita
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Número de colunas
          crossAxisSpacing: 10, // Espaçamento entre colunas
          mainAxisSpacing: 10, // Espaçamento entre linhas
          childAspectRatio: 0.9, // Proporção do item (mais alto para receitas)
        ),
        itemCount: mockRecipes.length,
        itemBuilder: (BuildContext context, int index) {
          final recipe = mockRecipes[index];

          return Card(
            elevation: 5,
            child: InkWell(
              onTap: () {
                // Aqui você pode navegar para a tela de detalhes da receita
                print('Clicou na receita ${recipe['name']}');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      recipe['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      recipe['name']!,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
