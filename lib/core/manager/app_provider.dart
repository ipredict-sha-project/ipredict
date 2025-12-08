import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode thememode = ThemeMode.light;
  String locale = 'en';

  bool get isDark => thememode == ThemeMode.dark;

  void changeTheme(ThemeMode theme) {
    thememode = theme;
    notifyListeners();
  }


// void changelocale(String loc) {
//   thememode = loc;
//   notifyListeners();
// }
}
