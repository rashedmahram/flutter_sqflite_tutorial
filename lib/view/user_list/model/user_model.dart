class UserModel {
  int id;
  String userName;
  int age;
  bool isMarid;

  UserModel({this.id, this.userName, this.age, this.isMarid});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    age = json['age'];
    isMarid = json['isMarid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['age'] = this.age;
    data['isMarid'] = this.isMarid;
    return data;
  }
}
