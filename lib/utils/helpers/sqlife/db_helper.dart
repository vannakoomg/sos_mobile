// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper extends GetxController {
  static DBHelper? _obj;
  DBHelper._();
  static DBHelper get obj => _obj ??= DBHelper._();
  Database? databaseObj;
  // Future<Database> get db async {
  //   if (databaseObj != null) return databaseObj!;
  //   databaseObj = await initDB();
  //   return databaseObj!;
  // }

  Future<Database> initDB() async {
    if (databaseObj != null) {
      return databaseObj!;
    } else {
      var dataBasepath = await getDatabasesPath();
      String path = join(dataBasepath, "my_database.db");
      var db = await openDatabase(path, version: 1, onCreate: _onCreate);
      return db;
    }
  }

  void _onCreate(Database db, int version) async {
    // Create the table
    await db.execute(
        "CREATE TABLE recent_search(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, type INTEGER)");
    await db.execute(
        "CREATE TABLE popular_search(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT,paramater TEXT, image TEXT)");
    await db.execute(
        "CREATE TABLE books(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, type INTEGER)");
  }

  Future close() async {
    databaseObj!.close();
  }
}
