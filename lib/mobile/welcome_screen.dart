import 'package:flutter/material.dart';

class WelcomeScreenMobile extends StatelessWidget {
  const WelcomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Welcome to Snippet"),
      ),
    );
  }
}
