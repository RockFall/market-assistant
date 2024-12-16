import 'package:flutter/material.dart';
import 'products/products_screen.dart';
import 'recipes/recipes_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const routeName = '/main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2; // O índice inicial será a tela principal: Plano de Receitas Atual.

  // Lista das telas principais
  final List<Widget> _screens = [
    const PlaceholderScreen(title: "Dispensa"), // Esquerda-Canto
    const ProductsScreen(), // Esquerda-Centro
    const PlaceholderScreen(title: "Plano de Receitas Atual"),
    //RecipePlanScreen(), // Centro
    const RecipesScreen(), // Direita-Centro
    const PlaceholderScreen(title: "Perfil"),
    //ProfileScreen(), // Direita-Canto
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.kitchen), label: "Dispensa"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Produtos",),
          BottomNavigationBarItem(icon: Icon(Icons.receipt),label: "Plano",),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book),label: "Receitas",),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Perfil",),
        ],
      ),
    );
  }
}

// Placeholder para as telas
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
