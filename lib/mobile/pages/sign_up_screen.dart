import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Snippet/mobile/pages/home_screen.dart';
import 'package:Snippet/services/auth_service.dart';
import 'package:Snippet/services/check_email_username.dart';

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
TextEditingController _usernameController = TextEditingController();

String? _name;
String? _email;
String? _passwd;
String? _username;

bool _isObscure = true;

CheckUsername? checkUsername;

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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Get Started",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'fill out the details to proceed',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 16,
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
                        horizontal: 24.0, vertical: 4.0),
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
                        horizontal: 24.0, vertical: 4.0),
                    child: TextField(
                      controller: _usernameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.perm_identity_rounded),
                        prefixIconColor: Colors.black87,
                        hintStyle: TextStyle(color: Colors.black87),
                        label: Text("Username"),
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
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        onPressed: () async {
                          _name = _nameController.text;
                          _email = _emailController.text;
                          _passwd = _passwdController.text;
                          _username = _usernameController.text;

                          checkDetails(
                              _name!, _email!, _passwd!, _username!, context);
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
        ),
      ),
    );
  }
}

void checkDetails(String name, String email, String passwd, String username,
    BuildContext context) {
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
  } else if (passwd.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password cannot be empty"),
      ),
    );
  } else if (username.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Username cannot be empty"),
      ),
    );
  } else {
    createUser(context);
  }
}

void createUser(BuildContext context) async {
  // Check if the username already exists
  CheckUsername checkUsername = CheckUsername(username: _username);
  bool usernameExists = await checkUsername.checkUserExists(_username!);

  if (usernameExists) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text("$_username already in use. Try selecting a different name."),
      ),
    );
  } else {
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
      await AuthService()
          .signUpWithEmail(_username!, _name!, _email!, _passwd!, context);
      Navigator.pop(context); // Hide loading indicator
      Navigator.pushNamed(context, HomeScreenMobile.id);
    } catch (e) {
      Navigator.pop(context); // Hide loading indicator
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error creating user: $e'),
        ),
      );
    }
  }
}
