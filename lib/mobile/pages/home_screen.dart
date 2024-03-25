import 'package:Snippet/mobile/pages/create_snip.dart';
import 'package:Snippet/mobile/pages/log_in_screen.dart';
import 'package:Snippet/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  static String id = "HomeScreenMobile";

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            showAlertDialog(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Home",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateSnipMobile.id);
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.create_rounded,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,

      //TODO: fetch snips from firebase and display here
      body: Center(
        child:
            Text("User logged in: ${FirebaseAuth.instance.currentUser!.email}"),
      ),
    );
  }
}

void showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("No"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Yes"),
    onPressed: () async {
      await AuthService().signUserOut();
      Navigator.of(context).pop(LogInScreen.id);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Logout?"),
    content: const Text("Are you sure you want to logout?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
