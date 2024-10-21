import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SettingsService {
  // Create an instance of FlutterSecureStorage
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static const String _themeModeKey = 'theme_mode';
  static const String _localeKey = 'locale';

  /// Loads the User's preferred ThemeMode from secure storage.
  Future<ThemeMode> themeMode() async {
    // Retrieve the value stored under the key 'theme_mode'
    final themeString = await _secureStorage.read(key: _themeModeKey);

    if (themeString == null) {
      return ThemeMode.system; // Default if no value is found
    }

    switch (themeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  /// Persists the user's preferred ThemeMode to secure storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    String themeString;

    switch (theme) {
      case ThemeMode.light:
        themeString = 'light';
        break;
      case ThemeMode.dark:
        themeString = 'dark';
        break;
      default:
        themeString = 'system';
    }

    // Store the theme string in secure storage
    await _secureStorage.write(key: _themeModeKey, value: themeString);
  }

  /// Loads the User's preferred Locale from secure storage.
  Future<Locale> locale() async {
    final localeString = await _secureStorage.read(key: _localeKey);
    if (localeString == null) {
      return const Locale('en'); // Default locale
    }
    return Locale(localeString);
  }

  /// Persists the user's preferred Locale to secure storage.
  Future<void> updateLocale(Locale locale) async {
    await _secureStorage.write(key: _localeKey, value: locale.languageCode);
  }
}
