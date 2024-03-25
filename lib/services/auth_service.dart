import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Snippet/data/user_data_model.dart';
import 'package:Snippet/data/username_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> signUpWithEmail(String userId, String userName, String userEmail,
      String userPasswd, BuildContext context) async {
    UserCredential? userCredential;

    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPasswd,
      );
    } on FirebaseAuthException catch (e) {
      String message = "";
      switch (e.code) {
        case 'weak-password':
          message = 'The password provided is too weak.';
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
          break;
        case 'email-already-in-use':
          message = 'The account already exists for that email.';
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
          break;
        default:
          message = 'An error occurred: ${e.message}';
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
      }
      print(message);
      // Show an error message to the user (e.g., using a SnackBar)
    } catch (e) {
      print('Error creating user: $e');
      // Handle other potential errors (e.g., Firestore errors)
    }

    if (userCredential != null) {
      String userUid = userCredential.user!.uid;
      UserDataModel? newUser = UserDataModel(
        username: userId,
        email: userEmail,
        name: userName,
        uid: userUid,
      );

      UsernameCollection? usernameCollection =
          UsernameCollection(username: userId);

      try {
        await _firestore.collection("user").doc(userId).set(newUser.toMap());
        await _firestore
            .collection("username")
            .doc(userId)
            .set(usernameCollection.toMap());
        print("User Created");
        // Show a success message to the user
      } catch (e) {
        print('Error adding user data to Firestore: $e');
        // Handle Firestore errors (e.g., show error message)
      }
    }
  }
}
