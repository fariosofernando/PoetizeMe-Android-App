import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'theme_notifier.dart';

SystemUiOverlayStyle systemUiOverlayStyle(BuildContext context) {
  final themeNotifier = Provider.of<ThemeNotifier>(context, listen: true);
  final currentTheme = themeNotifier.currentThemeMode;

  bool isDarkMode;

  switch (currentTheme) {
    case ThemeMode.dark:
      isDarkMode = true;
      break;
    case ThemeMode.light:
      isDarkMode = false;
      break;
    case ThemeMode.system:
    default:
      isDarkMode = (Theme.of(context).brightness == Brightness.dark);
      break;
  }

  return SystemUiOverlayStyle(
    systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
    statusBarColor: Theme.of(context).scaffoldBackgroundColor,
    systemNavigationBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
    statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
  );
}
