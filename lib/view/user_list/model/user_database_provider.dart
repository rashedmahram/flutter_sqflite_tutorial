import 'package:flutter_sqflite_tutorial/view/user_list/model/user_model.dart';
import 'package:sqflite/sqlite_api.dart';

import 'package:sqflite/sqflite.dart';

class UserDatabaseProvider {
  Database database;
  String _userDatabaseName = 'user';
  // ignore: unused_field
  int _version = 1;

  String _userTableName = "USER";

  String columnId = "id";
  String columnUserName = "user";
  String columnAge = "age";
  String columnIsMarried = "isMarried";
  Future<void> open() async {
    database = await openDatabase(
      _userDatabaseName,
      version: _version,
      onCreate: (db, version) {
        create(db);
      },
    );
  }

  void create(Database db) {
    db.execute(""" 
        CREATE TABLE $_userTableName ( 
          $columnId INTEGER PRIMARY KEY AUTOINCREMENT, 
          $columnUserName VARCHAR(20),
          $columnAge int, 
          $columnIsMarried bool
          )
        """);
  }

  Future<List<UserModel>> getList() async {
    if (database != null) open();
    List<Map> userMaps = await database.query(_userTableName);
    return userMaps.map((e) => UserModel.fromJson(e)).toList();
  }

  Future<UserModel> getItem(int id) async {
    if (database != null) open();
    final user = await database.query(_userTableName, where: '$columnId=?', whereArgs: [id], columns: [columnId]);
    if (user.isNotEmpty) {
      return UserModel.fromJson(user.first);
    } else {
      return null;
    }
  }

  Future<bool> deleteItem(int id) async {
    if (database != null) open();
    final userMaps = await database.delete(
      _userTableName,
      where: '$columnId=?',
      whereArgs: [id],
    );
    return userMaps != null;
  }

  Future<bool> update(int id, UserModel model) async {
    if (database != null) open();
    final userMaps = await database.update(
      _userTableName,
      model.toJson(),
      where: '$columnId=?',
      whereArgs: [id],
    );
    return userMaps != null;
  }

  Future<bool> insert(UserModel model) async {
    if (database != null) open();
    final userMaps = await database.insert(
      _userTableName,
      model.toJson(),
    );
    return userMaps != null;
  }

  Future<void> close(args) async {
    await database.close();
  }

  @override
  Future<bool> insertItem(UserModel model) async {
    if (database != null) open();

    final userMaps = await database.insert(
      _userTableName,
      model.toJson(),
    );

    return userMaps != null;
  }
}
