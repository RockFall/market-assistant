import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:shoppingplanner/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Integration Tests', () {
    testWidgets('Launch app and navigate between screens', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('Plano de Receitas Atual'), findsOneWidget);

      final productsTab = find.byIcon(Icons.shopping_cart);
      await tester.tap(productsTab);
      await tester.pumpAndSettle();

      expect(find.text('Produtos'), findsOneWidget);

      final recipesTab = find.byIcon(Icons.menu_book);
      await tester.tap(recipesTab);
      await tester.pumpAndSettle();

      expect(find.text('Receitas'), findsOneWidget);

      final recipeCard = find.text('Bolo de Chocolate');
      await tester.tap(recipeCard);
      await tester.pumpAndSettle();

      print('Clicou na receita!');
    });

    testWidgets('Add product from Products screen', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final productsTab = find.byIcon(Icons.shopping_cart);
      await tester.tap(productsTab);
      await tester.pumpAndSettle();

      final addButton = find.byIcon(Icons.add);
      await tester.tap(addButton);
      await tester.pumpAndSettle();
    });
  });
}
