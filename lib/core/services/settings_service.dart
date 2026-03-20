import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const _notifications = "notifications";
  static const _darkMode = "dark_mode";
  static const _username = "username";

  Future<void> setNotifications(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_notifications, value);
  }

  Future<bool> getNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_notifications) ?? true;
  }

  Future<void> setDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_darkMode, value);
  }

  Future<bool> getDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_darkMode) ?? false;
  }

  Future<void> setUsername(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_username, name);
  }

  Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_username) ?? "User";
  }
}
