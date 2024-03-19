import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snippet/mobile/welcome_screen.dart';
import 'package:snippet/web/welcome_screen.dart';

void main() {
  runApp(const MainApp());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.black, systemNavigationBarColor: Colors.black),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: (kIsWeb) ? WelcomeScreenWeb() : WelcomeScreenMobile(),
    );
  }
}
