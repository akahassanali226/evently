import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setTheme(ThemeMode mode) {
    prefs.setString("Theme", mode == ThemeMode.light ? "Light" : "Dark");
  }

  static ThemeMode getTheme() {
    String savedMode = prefs.getString("Theme") ?? "Light";

    if (savedMode == "Light") {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }
}
