import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Themes {
  int? id;
  int? themeValue;
  String? language;

  Themes({this.id, this.themeValue});

  Themes.fromMap(Map map) {
    this.id = map['id'];
    this.themeValue = map['ThemeValue'];
    this.language = map['language'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ThemeValue': themeValue,
      'language': language,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return '$id : $themeValue : $language';
  }
}
