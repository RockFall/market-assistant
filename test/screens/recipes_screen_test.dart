import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shoppingplanner/src/screens/recipes/recipes_screen.dart';

void main() {
  group('RecipesScreen Widget Tests', () {
    testWidgets('should display a grid of recipe cards', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: RecipesScreen()),
      );

      final cardFinder = find.byType(Card);

      expect(cardFinder, findsNWidgets(4));
    });

    testWidgets('should display recipe name and image in each card', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: RecipesScreen()),
      );

      final recipeNameFinder = find.text('Bolo de Chocolate');
      final recipeImageFinder = find.byType(Image);

      expect(recipeNameFinder, findsOneWidget);
      expect(recipeImageFinder, findsWidgets);
    });
  });
}
