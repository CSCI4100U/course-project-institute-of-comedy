import 'db_utils.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:zamazon/models/SettingLocalDB.dart';

class ThemeModel{
  Future<int> insertTheme(Themes theme) async{
    //This needs to be present in any queries, updates, etc.
    //you do with your database
    final db = await DBUtils.init();
    return db.insert(
      'themes',
      theme.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Future updateThemes(Database? db, Theme? theme) async{
  //   if (db == null) db = await DBUtils.init();
  //
  //   await db!.update('theme', theme!.toMap(),
  //       where: 'id = ?',
  //       whereArgs: [theme.id]
  //   );
  // }

  Future getThemesWithId(int id) async{
    //This needs to be present in any queries, updates, etc.
    //you do with your database
    final db = await DBUtils.init();
    final List maps = await db.query(
        'themes',
        where: 'id = ?',
        whereArgs: [id]
    );
    return Themes.fromMap(maps[0]);
  }
}