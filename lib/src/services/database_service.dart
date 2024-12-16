class DatabaseService {
  static final Map<String, dynamic> _mockDatabase = {
    'products': [],
    'recipes': [],
  };

  Future<List<Map<String, dynamic>>> getData(String table) async {
    return List<Map<String, dynamic>>.from(_mockDatabase[table] ?? []);
  }

  Future<void> insertData(String table, Map<String, dynamic> data) async {
    _mockDatabase[table] = [...?_mockDatabase[table], data];
  }

  Future<void> clearTable(String table) async {
    _mockDatabase[table] = [];
  }
}
