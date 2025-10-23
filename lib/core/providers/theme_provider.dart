import 'package:evently/core/source/local/prefs_manager.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;

  init() {
    mode = PrefsManager.getTheme();
  }

  changeTheme(ThemeMode newMode) {
    mode = newMode;
    notifyListeners();
  }
}
