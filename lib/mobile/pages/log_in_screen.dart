import 'package:Snippet/mobile/pages/home_screen.dart';
import 'package:Snippet/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInScreen extends StatefulWidget {
  static String id = "LogInScreen";
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _passwdController = TextEditingController();

String? _email;
String? _passwd;

bool _isObscure = true;

class _LogInScreenState extends State<LogInScreen> {
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
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Snippet",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back!",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black87),
                    label: Text("Email"),
                    prefixIcon: Icon(Icons.email_rounded),
                    prefixIconColor: Colors.black87,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: TextField(
                  controller: _passwdController,
                  obscureText: _isObscure,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password_rounded),
                    prefixIconColor: Colors.black87,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: _isObscure
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                    hintStyle: const TextStyle(color: Colors.black87),
                    label: const Text("Password"),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () async {
                      _email = _emailController.text;
                      _passwd = _passwdController.text;

                      checkDetails(_email!, _passwd!, context);
                    },
                    child: Text(
                      "Next",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

void checkDetails(String t, String u, BuildContext context) {
  if (t.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Email cannot be empty"),
      ),
    );
  } else if (u.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password cannot be empty"),
      ),
    );
  } else {
    signUserIn(context);
  }
}

Future<void> signUserIn(BuildContext context) async {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    builder: (BuildContext context) => const Center(
      child: CircularProgressIndicator(
        color: Colors.black,
      ),
    ),
  );

  try {
    await AuthService().signUserInWithEmailPasswd(_email!, _passwd!, context);
    Navigator.pop(context); // Hide loading indicator
    Navigator.pushNamed(context, HomeScreenMobile.id);
  } catch (e) {
    Navigator.pop(context); // Hide loading indicator
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error logging in: $e'),
      ),
    );
  }
}
