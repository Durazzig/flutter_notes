import 'package:flutter/material.dart';
import 'package:flutter_notes/features/shared/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void changeTheme() {
    themeData = _themeData == lightMode ? darkMode : lightMode;
  }
}
