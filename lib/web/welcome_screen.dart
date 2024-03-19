import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreenWeb extends StatefulWidget {
  const WelcomeScreenWeb({Key? key}) : super(key: key);

  @override
  State<WelcomeScreenWeb> createState() => _WelcomeScreenWebState();
}

class _WelcomeScreenWebState extends State<WelcomeScreenWeb>
    with TickerProviderStateMixin {
  late AnimationController animationController1;
  late Animation<Color?> animation1;
  late AnimationController animationController2;
  late Animation<Color?> animation2;
  bool isHoveringButton1 = false;
  bool isHoveringButton2 = false;

  @override
  void initState() {
    super.initState();
    animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    animation1 = ColorTween(begin: Colors.black, end: Colors.white)
        .animate(animationController1);

    animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    animation2 = ColorTween(begin: Colors.black, end: Colors.white)
        .animate(animationController2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  "Welcome to Snippet",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Develop, Share, Connect and much more",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black87,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 768.0),
                  width: double.maxFinite,
                  child: MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        isHoveringButton1 = true;
                      });
                      animationController1.forward();
                    },
                    onExit: (_) {
                      setState(() {
                        isHoveringButton1 = false;
                      });
                      animationController1.reverse();
                    },
                    child: AnimatedBuilder(
                      animation: animation1,
                      builder: (context, child) {
                        return ElevatedButton(
                          onPressed: () => print("Log In"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                isHoveringButton1
                                    ? Colors.white.withOpacity(0.7)
                                    : animation1.value),
                            elevation: MaterialStateProperty.all(
                                isHoveringButton1 ? 15 : 0),
                          ),
                          child: Text(
                            "Log In",
                            style: GoogleFonts.poppins(
                              color: isHoveringButton1
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 768.0),
                  width: double.maxFinite,
                  child: MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        isHoveringButton2 = true;
                      });
                      animationController2.forward();
                    },
                    onExit: (_) {
                      setState(() {
                        isHoveringButton2 = false;
                      });
                      animationController2.reverse();
                    },
                    child: AnimatedBuilder(
                      animation: animation2,
                      builder: (context, child) {
                        return ElevatedButton(
                          onPressed: () => print("Sign Up"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                isHoveringButton2
                                    ? Colors.white.withOpacity(0.7)
                                    : animation2.value),
                            elevation: MaterialStateProperty.all(
                                isHoveringButton2 ? 15 : 0),
                          ),
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.poppins(
                              color: isHoveringButton2
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        );
                      },
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

  @override
  void dispose() {
    animationController1.dispose();
    animationController2.dispose();
    super.dispose();
  }
}
