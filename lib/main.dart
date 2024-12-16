import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

import 'src/services/database_service.dart';
import 'src/services/product_service.dart';
import 'src/services/recipe_service.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  final databaseService = DatabaseService();
  final productService = ProductService(databaseService);
  final recipeService = RecipeService(databaseService);

  await productService.loadMockProducts();
  await recipeService.loadMockRecipes();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(ShoppingPlannerApp(settingsController: settingsController));
}
