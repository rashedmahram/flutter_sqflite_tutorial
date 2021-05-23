import 'package:flutter/material.dart';
import 'package:flutter_sqflite_tutorial/view/user_list/model/user_model.dart';
import './user.dart';
import 'model/user_database_provider.dart';

abstract class UserViewModel extends State<User> {
  // Add your state and logic here

  UserDatabaseProvider userDatabaseProvider;

  UserModel userModel;

  @override
  void initState() {
    super.initState();
    userDatabaseProvider = UserDatabaseProvider();
    userDatabaseProvider.open();
  }
}
