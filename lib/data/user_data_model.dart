class UserDataModel {
  String? name;
  String? email;
  String? uid;

  UserDataModel({required this.name, required this.email, required this.uid});

  UserDataModel.fromMap(Map<String, dynamic> map) {
    uid = map['uid'];
    name = map['name'];
    email = map['email'];
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "name": name,
    };
  }
}
