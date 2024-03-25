import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Snippet/firebase_options.dart';
import 'package:Snippet/mobile/pages/home_screen.dart';
import 'package:Snippet/mobile/pages/sign_up_screen.dart';
import 'package:Snippet/mobile/pages/welcome_screen.dart';
import 'package:Snippet/web/pages/welcome_screen.dart';

Future<void> main() async {
  runApp(const MainApp());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.black, systemNavigationBarColor: Colors.black),
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: (kIsWeb) ? WelcomeScreenWeb.id : WelcomeScreenMobile.id,
      initialRoute: (kIsWeb) ? WelcomeScreenWeb.id : WelcomeScreenMobile.id,
      home: (kIsWeb) ? const WelcomeScreenWeb() : const WelcomeScreenMobile(),
      routes: {
        //routes for mobile
        WelcomeScreenMobile.id: (context) => const WelcomeScreenMobile(),
        SignUpScreenMobile.id: (context) => const SignUpScreenMobile(),
        HomeScreenMobile.id: (context) => const HomeScreenMobile(),

        //routes for website
        WelcomeScreenWeb.id: (context) => const WelcomeScreenWeb(),
      },
    );
  }
}
