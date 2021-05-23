import 'package:flutter/material.dart';
import 'package:flutter_sqflite_tutorial/view/user_list/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Notes SQLite';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.blueGrey.shade900,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: User(),
    );
  }
}
