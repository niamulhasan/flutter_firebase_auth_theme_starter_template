import 'package:shared_preferences/shared_preferences.dart';

import '../providers/theme_provider.dart';

class ThemeService {
  static Future<bool> saveThemeName(AppTheme themeName) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString("app_theme", themeName.toString());
  }

  static Future<AppTheme?> getSavedTheme(AppTheme defaultThemeName) async {
    final prefs = await SharedPreferences.getInstance();
    String? savedName = prefs.getString("app_theme");
    if (savedName != null) {
      AppTheme themeName =
          AppTheme.values.firstWhere((e) => e.toString() == savedName);
      return themeName;
    } else {
      return null;
    }
  }
}
