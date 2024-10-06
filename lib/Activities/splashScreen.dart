import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:log_in/Activities/logIn.dart';
import 'package:log_in/essetials/auth_gate.dart';
import 'package:lottie/lottie.dart';

class SplashActivity extends StatefulWidget {
  const SplashActivity({super.key});

  @override
  State<SplashActivity> createState() => _SplashActivityState();
}

class _SplashActivityState extends State<SplashActivity> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    // Start the login check
    splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.purpleAccent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                "animations/splashanimation.json",
                height: 180,
                fit: BoxFit.cover,
                repeat: true,
              ),
              SizedBox(height: 20), // Add some space between the animation and text
              Text(
                "Composie",
                style: TextStyle(
                  fontSize: 28, // Adjust font size as needed
                  fontWeight: FontWeight.w400,
                  fontFamily: "composie",
                  color: Colors.white, // Change text color if necessary
                ),
              ),
              Text(
                "Enjoy private chatting.",
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: "composielite",
                  color: Colors.green.shade100,
                  fontWeight: FontWeight.bold
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
      Duration(seconds: 3),
          () => Get.to(Auth_Gate(),transition: Transition.circularReveal,duration: Duration(seconds: 2))
    );
  }
}
