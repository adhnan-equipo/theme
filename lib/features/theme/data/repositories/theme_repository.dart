// lib/features/theme/data/repositories/theme_repository.dart
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/theme_model.dart';

class ThemeRepository {
  static const String _themeKey = 'app_theme';

  Future<void> saveTheme(ThemeModel theme) async {
    final prefs = await SharedPreferences.getInstance();
    final themeJson = jsonEncode(theme.toJson());
    await prefs.setString(_themeKey, themeJson);
  }

  Future<ThemeModel> loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeJson = prefs.getString(_themeKey);

      if (themeJson != null) {
        final themeMap = jsonDecode(themeJson) as Map<String, dynamic>;
        return ThemeModel.fromJson(themeMap);
      }
    } catch (e) {
      print('Error loading theme: $e');
    }

    // Return default theme if loading fails
    return const ThemeModel();
  }
}
