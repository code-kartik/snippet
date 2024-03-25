class UsernameCollection {
  String? username;

  UsernameCollection({required this.username});

  UsernameCollection.fromMap(Map<String, dynamic> map) {
    username = map['username'];
  }

  Map<String, dynamic> toMap() {
    return {
      "username": username,
    };
  }
}
