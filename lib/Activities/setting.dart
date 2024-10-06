import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:log_in/Activities/logIn.dart';
import 'package:log_in/essetials/auth_gate.dart';

import '../essetials/firebase_auth.dart';
import 'Home.dart';

class Settings_Activity extends StatefulWidget {
  const Settings_Activity({super.key});

  @override
  State<Settings_Activity> createState() => _SettingsState();
}

class _SettingsState extends State<Settings_Activity> {
  final auth_Services _auth = auth_Services();

  void log_OUT(){
    final _auth_logout = auth_Services();

    try{
      _auth_logout.signOUT();
      Future.delayed(Duration(seconds: 3));
      Get.to(Auth_Gate());
    }
    catch(e){
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text(e.toString()),
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 35,left: 10,right: 10,bottom: 10),
              color: Colors.deepPurple,
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    Get.to(HomePage());
                  }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
                  SizedBox(width: 10,),
                  Expanded(child: Text("Account",style: TextStyle(fontFamily: "composie",fontWeight: FontWeight.w600,color: Colors.white,fontSize: 20),)),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
              child: Center(

                child: Column(

                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.deepPurple,
                      child: Icon(Icons.person_2,color: Colors.white,size: 80,),
                    ),
                    SizedBox(height: 17,),
                    Container(

                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurple,width: 1)
                      ),
                      child: ListTile(

                        leading: Icon(Icons.email,color: Colors.deepPurple,),

                        title: const Text("Email"),
                        subtitle: Text(_auth.getCurrentUser()!.email.toString(),),
                      ),
                    ),

                    SizedBox(height: 17,),
                    ElevatedButton(
                      style: ButtonStyle(

                        backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                        iconColor: MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: (){
                        log_OUT();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout,color: Colors.black,),
                          SizedBox(width: 10,),
                          Text("Log out",style: TextStyle(fontSize: 20,color: Colors.black,fontFamily: "composie"),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )

          ],
        ),
      ),


    );
  }
}
