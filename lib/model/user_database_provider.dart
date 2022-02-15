import 'package:flutter_sqflite/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class UserProvider {
  //// open
  //// create
  //// close
  //// insert
  //// update
  //// delete
  //// getItems
  //// delete table
// =========
//// userDatabaseName
//// userDatabaseTbName
//// db_version
//// id_col
//// name_col
//// age_col
//// isMaried_col
// ======
//// Database==>sqflite > copy

  final String userDatabaseName = "UsersDB";
  final String userDatabaseTbName = "tb_users";
  final int db_version = 1;
  final String id_col = "id";
  final String name_col = "name";
  final String age_col = "age";
  final String isMaried_col = "isMaried";

  late Database database;
  Future<void> open() async {
    database = await openDatabase(userDatabaseName, version: db_version,
        onCreate: (db, version) {
      createTable(db);
    });
  }

  Future<void> createTable(Database db) async {
    String sql = '''
          CREATE TABLE 
            $userDatabaseTbName ( 
            $id_col integer PRIMARY KEY AUTOINCREMENT,
            $name_col varchar(30),
            $age_col integer,
            $isMaried_col bool )
            ''';
    await db.execute(sql);
  }

  void close() {
    database.close();
  }

// input as user model
  Future<bool> insertUser(UserModel user) async {
    if (database != null) open();
    final userMap = await database.insert(userDatabaseTbName, user.toJson());
    return userMap != null;
  }

  Future<bool> updateUser(UserModel user, int id) async {
    if (database != null) open();
    final userMap = await database.update(userDatabaseTbName, user.toJson(),
        where: '$id_col=?', whereArgs: [id]);
    return userMap != null;
  }

  Future<bool> deleteUser(int id) async {
    if (database != null) open();
    final userMap = await database
        .delete(userDatabaseTbName, where: '$id_col=?', whereArgs: [id]);
    return userMap != null;
  }

  Future<UserModel?> getUser(int id) async {
    if (database != null) open();
    final userMap = await database.query(
      userDatabaseTbName,
      where: '$id_col=?',
      whereArgs: [id],
      columns: [id_col],
    );
    if (userMap.isNotEmpty) {
      return UserModel.fromJson(userMap.first);
    } else {
      return null;
    }
  }

  Future<List<UserModel>?> getUsers() async {
    if (database != null) open();
    final userMap = await database.query(userDatabaseTbName);
    if (userMap.isNotEmpty) {
      return userMap.map((e) => UserModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  Future<bool>deleteAllUsers()async{
    if (database != null) open();
    String sql='''
              DROP TABLE IF EXISTS $userDatabaseTbName
              ''';
    final userMap= await database.execute(sql);
    return database!=null;
  }
}
