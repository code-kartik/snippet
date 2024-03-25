class UserDataModel {
  String? name;
  String? email;
  String? uid;
  String? username;

  UserDataModel(
      {required this.username,
      required this.name,
      required this.email,
      required this.uid});

  UserDataModel.fromMap(Map<String, dynamic> map) {
    username = map['username'];
    uid = map['uid'];
    name = map['name'];
    email = map['email'];
  }

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "uid": uid,
      "email": email,
      "name": name,
    };
  }
}
