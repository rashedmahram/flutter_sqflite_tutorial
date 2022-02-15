class UserModel {
  int? id;
  String? name;
  int? age;
  bool? isMaried;

  UserModel({this.id, this.name, this.age, this.isMaried});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    isMaried = json['isMaried']is int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['isMaried'] = this.isMaried;
    return data;
  }
}
