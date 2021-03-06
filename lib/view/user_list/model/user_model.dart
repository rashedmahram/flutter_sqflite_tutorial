class UserModel {
  int id;
  String user;
  int age;
  bool isMarried;

  UserModel({this.id, this.user, this.age, this.isMarried});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    age = json['age'];
    isMarried = json['isMarried'] == 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['age'] = this.age;
    data['isMarried'] = this.isMarried == true ? 1 : 0;

    if (id != null) {
      data['id'] = this.id;
    }
    return data;
  }
}
