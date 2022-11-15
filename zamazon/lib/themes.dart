import 'package:flutter/material.dart';
import 'package:zamazon/models/theme_model.dart';
import 'package:zamazon/models/SettingLocalDB.dart';

class ThemeProvider extends ChangeNotifier{
  var _model = ThemeModel();
  var _lastInsertedId = 0;
  int id = 0;
  Themes? getTheme;

  Future _getTheme() async{
    getTheme = await _model.getThemesWithId(id);
    return getTheme;
  }

  Future _addTheme(int mode) async{
    Themes addTheme = Themes(id: id, ThemeValue: mode);
    _lastInsertedId = await _model.insertTheme(addTheme);
  }

  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn){
    isOn ? _addTheme(1) : _addTheme(0);
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
  );
}