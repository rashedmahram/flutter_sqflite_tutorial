import 'package:flutter/material.dart';
import './user_view_model.dart';

class UserView extends UserViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(userModel.userName);
        },
      ),
      body: Card(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                userModel.userName = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "User Name ",
              ),
            ),
            TextField(
              onChanged: (value) {
                userModel.age = int.tryParse(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Age",
              ),
            ),
            TextField(
              onChanged: (value) {
                userModel.isMarid = value.isEmpty;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Is Married",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
