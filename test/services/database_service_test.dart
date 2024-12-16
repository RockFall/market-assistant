import 'package:flutter_test/flutter_test.dart';
import 'package:shoppingplanner/src/services/database_service.dart';

void main() {
  late DatabaseService databaseService;

  setUp(() {
    databaseService = DatabaseService();
  });

  group('DatabaseService', () {
    test('should insert and retrieve data correctly', () async {
      await databaseService.insertData('test', {'key': 'value'});
      final data = await databaseService.getData('test');
      expect(data.first['key'], 'value');
    });

    test('should clear data from a specific table', () async {
      await databaseService.insertData('test', {'key': 'value'});
      await databaseService.clearTable('test');
      final data = await databaseService.getData('test');
      expect(data.isEmpty, true);
    });
  });
}
