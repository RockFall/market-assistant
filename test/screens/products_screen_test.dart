import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shoppingplanner/src/screens/products/products_screen.dart';
import 'package:shoppingplanner/src/services/database_service.dart';
import 'package:shoppingplanner/src/services/product_service.dart';

void main() {
  group('ProductsScreen Widget Tests', () {
    testWidgets('should display a grid of product cards', (WidgetTester tester) async {
  final mockProductService = ProductService(DatabaseService());
  await mockProductService.loadMockProducts();

  await tester.pumpWidget(MaterialApp(
    home: ProductsScreen(),
  ));

  await tester.pumpAndSettle();

  expect(find.byType(Card), findsWidgets);
  expect(find.text('Macarrão Lasanha'), findsAny);
});

 testWidgets('should navigate to add product screen when add button is clicked', (WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(home: ProductsScreen()));

  await tester.pumpAndSettle();

  final addButton = find.byKey(const Key('addProductButton'));
  expect(addButton, findsOneWidget);

  await tester.tap(addButton);
  await tester.pumpAndSettle();

  print("Teste concluído: Botão de adicionar clicado.");
});


    testWidgets('should filter products by category using dropdown', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProductsScreen()));

      await tester.pumpAndSettle();

      expect(find.text('Macarrão Lasanha'), findsAny);
      expect(find.text('Tomate'), findsAny);

      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Massas').last);
      await tester.pumpAndSettle();

      expect(find.text('Macarrão Lasanha'), findsAny);
      expect(find.text('Tomate'), findsNothing);
    });
  });
}
