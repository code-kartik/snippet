import 'package:flutter/material.dart';

class WelcomeScreenWeb extends StatelessWidget {
  const WelcomeScreenWeb({super.key});

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
