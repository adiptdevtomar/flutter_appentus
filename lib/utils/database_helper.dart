// Created by Adipt on 17/01/2022

import 'dart:io';
import 'package:appentus_flutter/data/user.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db
        .execute("CREATE TABLE User(email TEXT, name TEXT, password TEXT, phone Text, image BLOB)");
    print("Table is created");
  }

  //insertion
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery(
        "SELECT * FROM user WHERE email = '${user.email}'");
    if (res.isNotEmpty) {
      return 0;
    } else {
      int response = await dbClient.insert("User", user.toMap());
      List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
      print(list);
      return response;
    }
  }

  Future<User?> getUser(String email) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery(
        "SELECT * FROM user WHERE email = '$email'");
    print(res);

    if (res.isNotEmpty) {
      return User.fromMap(res.first);
    }
    return null;
  }

  Future<User?> getLogin(String email, String password) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery(
        "SELECT * FROM user WHERE email = '$email' and password = '$password'");
    print(res);

    if (res.isNotEmpty) {
      return User.fromMap(res.first);
    }
    return null;
  }
}
