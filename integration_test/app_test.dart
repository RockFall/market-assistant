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
    testWidgets('should load initial screen with "Plano de Receitas Atual"',
        (WidgetTester tester) async {
      final settingsController = SettingsController(SettingsService());
      await settingsController.loadSettings();
      await tester.pumpWidget(
          ShoppingPlannerApp(settingsController: settingsController));

      await tester.pumpAndSettle();

      expect(find.text('Plano de Receitas Atual'), findsOneWidget);
    });

    testWidgets(
        'should navigate to Products screen when shopping cart icon is tapped',
        (WidgetTester tester) async {
      final settingsController = SettingsController(SettingsService());
      await settingsController.loadSettings();
      await tester.pumpWidget(
          ShoppingPlannerApp(settingsController: settingsController));

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();

      expect(find.text('Produtos'), findsOneWidget);
    });

    testWidgets(
        'should navigate to Recipes screen when recipe book icon is tapped',
        (WidgetTester tester) async {
      final settingsController = SettingsController(SettingsService());
      await settingsController.loadSettings();
      await tester.pumpWidget(
          ShoppingPlannerApp(settingsController: settingsController));

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.menu_book));
      await tester.pumpAndSettle();

      expect(find.text('Receitas'), findsOneWidget);
    });

    testWidgets('should navigate to Profile screen when person icon is tapped',
        (WidgetTester tester) async {
      final settingsController = SettingsController(SettingsService());
      await settingsController.loadSettings();
      await tester.pumpWidget(
          ShoppingPlannerApp(settingsController: settingsController));

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();

      expect(find.text('Perfil'), findsOneWidget);
    });

    testWidgets('should display mock products in ProductsScreen',
        (WidgetTester tester) async {
      final settingsController = SettingsController(SettingsService());
      await settingsController.loadSettings();
      await tester.pumpWidget(
          ShoppingPlannerApp(settingsController: settingsController));

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();

      expect(find.text('Macarrão'), findsOneWidget);
      expect(find.text('Tomate'), findsOneWidget);
    });

    testWidgets('should display product cards in ProductsScreen',
        (WidgetTester tester) async {
      final settingsController = SettingsController(SettingsService());
      await settingsController.loadSettings();
      await tester.pumpWidget(
          ShoppingPlannerApp(settingsController: settingsController));

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();

      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('should filter products by category',
        (WidgetTester tester) async {
      final settingsController = SettingsController(SettingsService());
      await settingsController.loadSettings();
      await tester.pumpWidget(
          ShoppingPlannerApp(settingsController: settingsController));

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

    testWidgets('should display mock recipes in RecipesScreen',
        (WidgetTester tester) async {
      final settingsController = SettingsController(SettingsService());
      await settingsController.loadSettings();
      await tester.pumpWidget(
          ShoppingPlannerApp(settingsController: settingsController));

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.menu_book));
      await tester.pumpAndSettle();

      expect(find.text('Bolo de Chocolate'), findsOneWidget);
      expect(find.text('Lasanha'), findsOneWidget);
    });

    testWidgets('should display recipe cards in RecipesScreen',
        (WidgetTester tester) async {
      final settingsController = SettingsController(SettingsService());
      await settingsController.loadSettings();
      await tester.pumpWidget(
          ShoppingPlannerApp(settingsController: settingsController));

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.menu_book));
      await tester.pumpAndSettle();

      expect(find.byType(Card), findsWidgets);
    });
  });
}
