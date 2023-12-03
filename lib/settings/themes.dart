import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
);

class ThemeNotifier extends ChangeNotifier {
  late SharedPreferences _prefs;

  bool _useSystemTheme = true;
  bool _isDarkTheme = false;

  ThemeNotifier() {
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _useSystemTheme = _prefs.getBool("useSystemTheme") ?? true;
    _isDarkTheme = _prefs.getBool("isDarkTheme") ?? false;
    notifyListeners();
  }

  bool get useSystemTheme => _useSystemTheme;
  bool get isDarkTheme => _isDarkTheme;

  Future<void> _savePrefs(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  void setUseSystemTheme(bool value) {
    _useSystemTheme = value;
    _savePrefs("useSystemTheme", value);
    notifyListeners();
  }

  void setDarkTheme(bool value) {
    _isDarkTheme = value;
    _savePrefs("isDarkTheme", value);
    notifyListeners();
  }
}
