import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snippet/mobile/pages/sign_up_screen.dart';

class WelcomeScreenMobile extends StatelessWidget {
  const WelcomeScreenMobile({super.key});

  static String id = "WelcomeScreenMobile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => SystemNavigator.pop(),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Snippet",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Welcome to\nSnippet",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Develop, Share, Connect, Collaborate and much more",
                  style: GoogleFonts.poppins(
                    fontSize: 8.1,
                    color: Colors.black87,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 64.0),
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () => print("Yet to set"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: Text(
                      "Log In",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 64.0),
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, SignUpScreen.id),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
