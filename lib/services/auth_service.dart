import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:snippet/data/user_data_model.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  void signUpWithEmail(
      String userName, String userEmail, String userPasswd) async {
    UserCredential? userCredential;

    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: userEmail, password: userPasswd);
    } on FirebaseAuthException catch (e) {
      print(e.code.toString());
    }

    if (userCredential != null) {
      String userUid = userCredential.user!.uid;
      UserDataModel? newUser =
          UserDataModel(email: userEmail, name: userName, uid: userUid);

      await _firestore
          .collection("user")
          .doc(userEmail)
          .set(newUser.toMap())
          .then((value) {
        print("User Created");
      });
    }
  }
}
