import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Colors.purple,
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: Colors.white,
    ),
  ),
  useMaterial3: true,
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.white,
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: Colors.black,
    ),
  ),
  useMaterial3: true,
);
