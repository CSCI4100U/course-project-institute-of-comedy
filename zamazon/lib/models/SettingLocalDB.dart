import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Themes {
  int? id;
  int? ThemeValue;

  Themes({this.id, this.ThemeValue});

  Themes.fromMap(Map map){
    this.id = map['id'];
    this.ThemeValue = map['ThemeValue'];
  }

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'ThemeValue' : ThemeValue,
    };
  }
}
