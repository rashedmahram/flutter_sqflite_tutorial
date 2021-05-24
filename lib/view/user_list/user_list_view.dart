import 'package:flutter/material.dart';
import './user_list_view_model.dart';

class UserListView extends UserListViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildButton,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Expanded(child: buildInputItems),
              Flexible(
                child: ListView.builder(
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(userList[index].user),
                        subtitle: Text(userList[index].age.toString()),
                        trailing: Icon(
                          Icons.check,
                          color: userList[index].isMarried == 1 ? Colors.green : Colors.red,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FloatingActionButton get buildButton {
    return FloatingActionButton(
      child: Text("save"),
      onPressed: () async {
        saveModel();
        return await getUserList();
      },
    );
  }

  Wrap get buildInputItems {
    return Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (e) => userModel.user = e,
              decoration: InputDecoration(
                hintText: "User Name",
                border: InputBorder.none,
              ),
            ),
            TextField(
              onChanged: (e) => userModel.age = int.tryParse(e),
              decoration: InputDecoration(
                hintText: "User Age",
                border: InputBorder.none,
              ),
            ),
            TextField(
              onChanged: (e) => userModel.isMarried = e.isEmpty,
              decoration: InputDecoration(
                hintText: "Is Married",
                border: InputBorder.none,
              ),
            )
          ],
        ),
      ],
    );
  }
}
