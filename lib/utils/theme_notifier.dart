import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum ThemeModeSetting {
  dark,
  light,
  system,
}

class ThemeNotifier extends ValueNotifier<String> {
  final Box _box;

  ThemeNotifier(this._box) : super(_box.get('themeMode') ?? ThemeModeSetting.system.name);

  ThemeModeSetting get currentSetting {
    switch (value) {
      case "dark":
        return ThemeModeSetting.dark;
      case "light":
        return ThemeModeSetting.light;
      case "system":
      default:
        return ThemeModeSetting.system;
    }
  }

  ThemeMode get currentThemeMode {
    switch (value) {
      case "dark":
        return ThemeMode.dark;
      case "light":
        return ThemeMode.light;
      case "system":
      default:
        return ThemeMode.system;
    }
  }

  void toggleTheme(String newTheme) {
    value = newTheme;
    _box.put('themeMode', newTheme);
  }
}
