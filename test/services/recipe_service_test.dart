import 'package:flutter_test/flutter_test.dart';
import 'package:shoppingplanner/src/services/database_service.dart';
import 'package:shoppingplanner/src/services/recipe_service.dart';
import 'package:shoppingplanner/src/data/mock_recipes.dart';

void main() {
  late DatabaseService databaseService;
  late RecipeService recipeService;

  setUp(() {
    databaseService = DatabaseService();
    recipeService = RecipeService(databaseService);
  });

  group('RecipeService', () {
    test('should load mock recipes into the database', () async {
      await recipeService.loadMockRecipes();
      final recipes = await recipeService.getAllRecipes();
      expect(recipes.length, mockRecipes.length);
    });

    test('should retrieve all recipes from the database', () async {
      await recipeService.loadMockRecipes();
      final recipes = await recipeService.getAllRecipes();
      expect(recipes.first['name'], mockRecipes.first['name']);
    });

    test('should clear all recipes from the database', () async {
      await recipeService.loadMockRecipes();
      await recipeService.clearRecipes();
      final recipes = await recipeService.getAllRecipes();
      expect(recipes.isEmpty, true);
    });

    test('should have an empty recipes table by default', () async {
      final recipes = await recipeService.getAllRecipes();
      expect(recipes.isEmpty, true);
    });
  });
}
