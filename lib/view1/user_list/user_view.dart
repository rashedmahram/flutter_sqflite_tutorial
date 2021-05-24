import 'package:flutter/material.dart';
import 'package:flutter_sqflite_tutorial/view/user_list/model/user_model.dart';
import './user_view_model.dart';

class UserView extends UserViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            saveModel();
            // getUserList();
          },
          child: Text("print"),
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InputTex(
                userModel: userModel,
                hintText: "user name",
                pres: (value) {
                  userModel.user = "ali";
                  userModel.age = 12;
                  userModel.isMarried = true;
                  print(userModel);
                },
              ),
              InputTex(
                userModel: userModel,
                hintText: "Age",
                pres: (value) {
                  // userModel.userName = value;
                  print(value);
                },
              ),
              InputTex(
                userModel: userModel,
                hintText: "is maried",
                pres: (value) {
                  // userModel.userName = value;
                  print(value);
                },
              ),
              // ListView.builder(
              //   itemBuilder: (context, index) {
              //     return ListTile(
              //       title: Text(userList[index].userName),
              //       subtitle: Text(userList[index].age.toString()),
              //       trailing: Icon(
              //         Icons.check,
              //         color: userList[index].isMarid ? Colors.red : Colors.green,
              //       ),
              //     );
              //   },
              //   itemCount: userList.length,
              // ),
            ],
          ),
        ));
  }
}

class InputTex extends StatelessWidget {
  const InputTex({
    Key key,
    @required this.userModel,
    this.pres,
    this.hintText,
  }) : super(key: key);

  final UserModel userModel;
  final Function pres;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: pres,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}
