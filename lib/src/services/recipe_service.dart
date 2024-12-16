import '../data/mock_recipes.dart';
import 'database_service.dart';

class RecipeService {
  final DatabaseService _databaseService;

  RecipeService(this._databaseService);

  Future<void> loadMockRecipes() async {
    for (var recipe in mockRecipes) {
      await _databaseService.insertData('recipes', recipe);
    }
  }

  Future<List<Map<String, dynamic>>> getAllRecipes() async {
    return _databaseService.getData('recipes');
  }

  Future<void> clearRecipes() async {
    await _databaseService.clearTable('recipes');
  }
}
