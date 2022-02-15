import 'package:flutter/material.dart';
import 'package:flutter_sqflite/model/user_database_provider.dart';
import 'package:flutter_sqflite/model/user_model.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late UserProvider userProvider;
  UserModel userModel = UserModel();
  String sate = '';
  List<UserModel> userList = [];

  Future getUserList() async {
    userList = (await userProvider.getUsers())!;
    setState(() {});
  }

  Future<void> saveModel()async{
    final result=userProvider.insertUser(userModel);
    print(result);
  }

  Future<void> deleteUser(int i)async{
    final resutl= userProvider.deleteUser(i);
    setState(() {
      sate="$i just deleted ${resutl.toString()}";
    });
  }
  @override
  void initState() {
    super.initState();
    userProvider = UserProvider();
    userProvider.open();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveModel();
          getUserList();
          setState(() {
            sate = "saved model";
          });
        },
      ),
      body: SafeArea(

        child: Center(

          child: Container(
            padding:const EdgeInsets.all(14),
            child: Column(
              children: [
                Text(sate.toString()),
                Wrap(
                  runSpacing: 20,
                  children: [
                    TextField(
                      onChanged: (value) {
                        userModel.name = value;
                      },
                      decoration: const InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(),
                      ),
                    ),

                     TextField(
                      onChanged: (value) {
                        userModel.age = int.parse(value);
                      },
                      decoration: const InputDecoration(
                        hintText: "Age",
                        border: OutlineInputBorder(),
                      ),
                    ),


                     TextField(
                      onChanged: (value) {
                        userModel.isMaried = (value.isNotEmpty);
                      },
                      decoration: const InputDecoration(
                        hintText: "is Maried",
                        border: OutlineInputBorder(),
                      ),
                    ),


                  ],
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(child: Text("X"),onPressed: ()=>userProvider.deleteAllUsers(),)),
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    itemCount:userList.length,
                    shrinkWrap: true,
                    itemBuilder: (context,index)=>ListTile(
                    title: Text(
                      "${userList[index].name} "
                      // checkNotEmpty(index, '')
                    ),
                    subtitle: Text(userList[index].age.toString()),
                    trailing: TextButton(
                      onPressed: (){
                        deleteUser(index);
                      },
                      child: Icon(
                        Icons.check,color: Colors.blue,
                      ),
                    ),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String checkNotEmpty(index,val) {
    if(val!=null){
      return val.toString();
    }
    else{
      return "";
    }
  }
}
