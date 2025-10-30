import 'package:flutter/material.dart';
import 'package:food_delivery_app/theme/dark_mode.dart';
import 'package:food_delivery_app/theme/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;

  //getter
  bool get isDarkMode => _themeData == darkMode;

  //setter
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //theme toggler
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
