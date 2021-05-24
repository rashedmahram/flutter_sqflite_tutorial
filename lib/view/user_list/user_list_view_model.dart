import 'package:flutter/material.dart';
import 'package:flutter_sqflite_tutorial/view/user_list/model/user_database_provider.dart';
import 'package:flutter_sqflite_tutorial/view/user_list/model/user_model.dart';
import './user_list.dart';

abstract class UserListViewModel extends State<UserList> {
  UserDatabaseProvider userDatabaseProvider;
  UserModel userModel = UserModel();

  List<UserModel> userList;
  Future getUserList() async {
    userList = await userDatabaseProvider.getList();
    setState(() {});
    print("USER LIST:$userList");
  }

  @override
  void initState() {
    super.initState();
    userDatabaseProvider = UserDatabaseProvider();
    userDatabaseProvider.open();
  }

  Future<void> saveModel() async {
    print(userModel.user);
    print(userModel.id);
    print(userModel.age);
    print(userModel.isMarried);
    userModel.id = 19;
    final result = await userDatabaseProvider.insert(userModel);
    print("IS IT SAVED \n: $result");
  }
}
