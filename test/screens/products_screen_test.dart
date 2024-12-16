import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shoppingplanner/src/screens/products/products_screen.dart';

void main() {
  group('ProductsScreen Widget Tests', () {
    testWidgets('should display a grid of product cards', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: ProductsScreen()),
      );

      final cardFinder = find.byType(Card);

      expect(cardFinder, findsNWidgets(4));
    });

    testWidgets('should navigate to add product screen when add button is clicked', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: ProductsScreen()),
      );

      final addButtonFinder = find.byIcon(Icons.add);
      await tester.tap(addButtonFinder);
      await tester.pumpAndSettle();

      expect(find.text('Adicionar Produto'), findsNothing); 
    });
  });
}
