import 'db_utils.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:zamazon/models/SettingLocalDB.dart';

class ThemeModel{
  Future insertTheme( Themes theme) async{
    final db = await DBUtils.init();
    await db.insert(
      'themes',
      theme.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Themes> getThemesWithId(int id) async{
    final db = await DBUtils.init();
    final List maps = await db.query(
        'themes',
        where: 'id = ?',
        whereArgs: [id]
    );

    if(maps.isEmpty) {
      Themes defaultTheme = Themes(id: 0, themeValue: 0);
      await insertTheme(defaultTheme);

      return defaultTheme;
    }

    return Themes.fromMap(maps[0]);
  }
}