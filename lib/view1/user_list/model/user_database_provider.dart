import 'package:flutter_sqflite_tutorial/view/user_list/model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class UserDatabaseProvider {
  Database database;
  String _userDatabaseName = 'user';
  int _version = 1;
  String _userTableName = 'user';

  String columnUserName = "userName";
  String columnAge = "Age";
  String columnIsMarid = "IsMarid";
  String columnId = "id";
  //

  Future<void> open() async {
    database = await openDatabase(_userDatabaseName, version: _version, onCreate: (db, verion) {
      createTable(db);
    });
  }

  void createTable(Database db) {
    db.execute('''
        CREATE TABLE $_userTableName ( 
          $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
          $columnUserName TEXT,
          $columnAge integer, 
          $columnIsMarid bool
          )
        ''');
  }

  Future<List<UserModel>> getList() async {
    if (database != null) open();
    List<Map> userMaps = await database.query(_userTableName);
    return userMaps.map((e) => UserModel.fromJson(e)).toList();
  }

  Future<UserModel> getItem(int id) async {
    if (database != null) open();
    final userMaps = await database.query(
      _userTableName,
      where: '$columnId=?',
      whereArgs: [id],
      columns: [columnId],
    );

    if (userMaps.isNotEmpty) {
      return UserModel.fromJson(userMaps.first);
    } else
      return null;
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

  Future<bool> insertItem(UserModel model) async {
    if (database != null) open();

    final userMaps = await database.insert(
      _userTableName,
      model.toJson(),
    );

    return userMaps != null;
  }
}
