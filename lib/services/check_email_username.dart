import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CheckUsername {
  String? username; // Not used in checkUserExists method
  BuildContext? context;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CheckUsername({required this.username});

  Future<bool> checkUserExists(String uName) async {
    DocumentSnapshot userIdDocRef =
        await _firestore.collection("username").doc(uName).get();

    return userIdDocRef.exists;
  }
}
