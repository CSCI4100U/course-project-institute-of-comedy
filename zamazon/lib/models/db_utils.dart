import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBUtils {
  static Future init() async {
    return openDatabase(
      path.join(await getDatabasesPath(), 'zamazontest.db'),
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE themesa(id INTEGER PRIMARY KEY, ThemeValue INTEGER, language TEXT)');
      },
      version: 1,
    );
  }
}
