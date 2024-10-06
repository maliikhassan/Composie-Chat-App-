import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:log_in/Activities/logIn.dart';

import '../Activities/Home.dart';

class Auth_Gate extends StatelessWidget {
  const Auth_Gate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return const HomePage();
            }else{
              return const LoginScreen();
            }
          }),
    );
  }
}
