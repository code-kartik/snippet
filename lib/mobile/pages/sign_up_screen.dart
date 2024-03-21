import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snippet/mobile/pages/home_screen.dart';
import 'package:snippet/services/auth_service.dart';

class SignUpScreenMobile extends StatefulWidget {
  const SignUpScreenMobile({super.key});

  static String id = "SignUpScreenMobile";

  @override
  State<SignUpScreenMobile> createState() => _SignUpScreenMobileState();
}

// variables
TextEditingController _emailController = TextEditingController();
TextEditingController _passwdController = TextEditingController();
TextEditingController _nameController = TextEditingController();

late String _name;
late String _email;
late String _passwd;

bool _isObscure = true;

class _SignUpScreenMobileState extends State<SignUpScreenMobile> {
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Get Started",
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
                child: TextField(
                  maxLength: 50,
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    prefixIconColor: Colors.black87,
                    hintStyle: TextStyle(color: Colors.black87),
                    label: Text("Name"),
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
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
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
                    onPressed: () {
                      _name = _nameController.text;
                      _email = _emailController.text;
                      _passwd = _passwdController.text;
                      checkDetails(_name, _email, _passwd, context);
                    },
                    child: Text(
                      "Next",
                      style: GoogleFonts.poppins(color: Colors.white),
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

void checkDetails(
    String name, String email, String passwd, BuildContext context) {
  if (name.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Name cannot be empty"),
      ),
    );
  } else if (email.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Email cannot be empty"),
      ),
    );
  }
  if (passwd.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password cannot be empty"),
      ),
    );
  } else {
    createUser(context);
  }
}

void createUser(BuildContext context) {
  AuthService().signUpWithEmail(_name, _email, _passwd);
  Navigator.pushNamed(context, HomeScreenMobile.id);
}
