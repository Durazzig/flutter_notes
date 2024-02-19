import 'package:flutter/material.dart';
import 'package:flutter_notes/features/shared/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  ThemeProvider() {
    _loadTheme();
  }

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void changeTheme() {
    themeData = _themeData == lightMode ? darkMode : lightMode;
    _saveTheme(_themeData == darkMode ? 'dark' : 'light');
  }

  _saveTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkTheme = theme == 'dark';
    prefs.setBool('isDarkTheme', isDarkTheme);
  }

  _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    _themeData = isDarkTheme ? darkMode : lightMode;
    notifyListeners();
  }
}
