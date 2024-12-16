import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:shoppingplanner/main.dart';
import 'package:shoppingplanner/src/app.dart';

import 'package:shoppingplanner/src/settings/settings_controller.dart';
import 'package:shoppingplanner/src/settings/settings_service.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('ShoppingPlannerApp Integration Tests', () {
    testWidgets('should navigate between screens using the bottom navigation bar', (WidgetTester tester) async {
      final settingsController = SettingsController(SettingsService());
      await settingsController.loadSettings();
      await tester.pumpWidget(ShoppingPlannerApp(settingsController: settingsController));

      await tester.pumpAndSettle();

      expect(find.text('Plano de Receitas Atual'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();

      expect(find.text('Produtos'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.menu_book));
      await tester.pumpAndSettle();

      expect(find.text('Receitas'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();

      expect(find.text('Perfil'), findsOneWidget);
    });

    testWidgets('should display mock products in ProductsScreen', (WidgetTester tester) async {
      final settingsController = SettingsController(SettingsService());
      await settingsController.loadSettings();
      await tester.pumpWidget(ShoppingPlannerApp(settingsController: settingsController));

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();

      expect(find.text('Macarrão'), findsOneWidget);
      expect(find.text('Tomate'), findsOneWidget);
      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('should filter products by category', (WidgetTester tester) async {
      final settingsController = SettingsController(SettingsService());
      await settingsController.loadSettings();
      await tester.pumpWidget(ShoppingPlannerApp(settingsController: settingsController));

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();

      expect(find.text('Macarrão'), findsOneWidget);
      expect(find.text('Tomate'), findsOneWidget);

      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Massas').last);
      await tester.pumpAndSettle();

      expect(find.text('Macarrão Lasanha'), findsOneWidget);
      expect(find.text('Tomate'), findsNothing);
    });

    testWidgets('should display mock recipes in RecipesScreen', (WidgetTester tester) async {
      final settingsController = SettingsController(SettingsService());
      await settingsController.loadSettings();
      await tester.pumpWidget(ShoppingPlannerApp(settingsController: settingsController));

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.menu_book));
      await tester.pumpAndSettle();

      expect(find.text('Bolo de Chocolate'), findsOneWidget);
      expect(find.text('Lasanha'), findsOneWidget);
      expect(find.byType(Card), findsWidgets);
    });
  });
}
