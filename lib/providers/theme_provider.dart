import 'package:flutter/material.dart';
import '../services/theme_service.dart';

enum AppTheme { darkYellow, lightYellow }

class ThemeProvider with ChangeNotifier {
  ThemeData? _theme;
  AppTheme? _themeName;
  late List<ThemeData?> _themes;
  ThemeProvider(AppTheme themeName, {required themes}) : _themes = themes {
    _populateSavedTheme(themeName);
  }

  ThemeData? getTheme() => _theme;

  AppTheme? getThemeName() => _themeName;

  void setTheme(AppTheme themeName) {
    _setThemeState(themeName);
    ThemeService.saveThemeName(themeName);
    notifyListeners();
  }

  void _setThemeState(AppTheme themeName) {
    _themeName = themeName;

    switch (themeName) {
      case AppTheme.lightYellow:
        _theme = _themes[0];
        break;
      case AppTheme.darkYellow:
        _theme = _themes[1];
        break;
      default:
        _theme = _themes[1];
    }
  }

  Future<void> _populateSavedTheme(AppTheme defaultThemeName) async {
    AppTheme? savedTheme =
        await ThemeService.getSavedTheme(AppTheme.lightYellow);
    if (savedTheme != null) {
      _setThemeState(savedTheme);
    } else {
      _setThemeState(defaultThemeName);
    }
    notifyListeners();
  }
}
