import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.purple,
    secondary: Colors.grey.shade900,
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: Colors.white,
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.white,
  ),
  useMaterial3: true,
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.white,
    secondary: Colors.white,
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: Colors.black,
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.grey.shade900,
  ),
  useMaterial3: true,
);
