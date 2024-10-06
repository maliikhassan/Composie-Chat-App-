import 'dart:ffi';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:log_in/Activities/signup.dart';
import 'package:log_in/essetials/auth_gate.dart';
import 'package:log_in/essetials/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void logIn(BuildContext context) async{
    final _authService = auth_Services();

    try{
      await _authService.signInWithEmailPassword(_emailController.text, _passwordController.text);
      Get.to(Auth_Gate());
    }catch(e){
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text(e.toString()),
      ));
    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 180,
              color: Colors.purpleAccent,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 60,),
                    Text("Login",style: TextStyle(fontSize: 35,fontFamily: "Composie",color: Colors.white),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(color: Colors.white,height: 5,width: 60,),
                        SizedBox(width: 5,),
                        Container(color: Colors.deepPurple,height: 5,width: 5,),
                        SizedBox(width: 5,),
                        Container(color: Colors.deepPurple,height: 5,width: 5,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Expanded(child: Container(
                      decoration: BoxDecoration(

                        color: Colors.white,

                        borderRadius: BorderRadius.only(topRight: Radius.circular(60),topLeft: Radius.circular(60))
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(left: 20,right: 20,top: 40),

                            decoration: BoxDecoration(
                                border: Border.all(width: 1,color: Colors.purpleAccent),
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.all(Radius.circular(40))
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(

                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Icon(Icons.email,color: Colors.purpleAccent,),
                                      SizedBox(width: 10,),
                                      Expanded(child:
                                        TextField(
                                          controller: _emailController,
                                          keyboardType: TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            hintText: "Enter Your Email Adress.",
                                            hintStyle: TextStyle(
                                              fontFamily: "ComposieLite2"
                                            ),
                                              border: InputBorder.none
                                          ),
                                        )
                                      )
                                    ],
                                  ),
                                  height: 70,),
                                SizedBox(height: 12,),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Icon(Icons.key,color: Colors.purpleAccent,),
                                      SizedBox(width: 10,),
                                      Expanded(child:
                                      TextField(
                                        controller: _passwordController,
                                        obscureText: true,

                                        decoration: InputDecoration(

                                            hintText: "Enter Your Password.",
                                            hintStyle: TextStyle(
                                                fontFamily: "ComposieLite2"
                                            ),
                                            border: InputBorder.none
                                        ),
                                      )
                                      )
                                    ],
                                  ),
                                  height: 70,),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Didn't have account!.",style: TextStyle(fontSize: 16,color: Colors.black),),
                              SizedBox(width: 10,),
                              InkWell(
                                  onTap: (){
                                    Get.to(SignUp(),transition: Transition.rightToLeft,duration: Duration(seconds: 1));
                                  },
                                  child: Text("Sign up",style: TextStyle(fontSize: 16,color: Colors.deepPurple),)),

                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: 200,
                            height: 50,
                            //color: Colors.purpleAccent,
                            child: ElevatedButton(
                              style: ButtonStyle(

                                backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
                                iconColor: MaterialStateProperty.all(Colors.white),
                              ),
                                onPressed: (){
                                setState(() {
                                  isLoading = true;
                                });
                                Future.delayed(Duration(seconds: 2),(){
                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                                logIn(context);



                                },
                                child: isLoading?Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    CircularProgressIndicator(color: Colors.white,),
                                    SizedBox(width: 10,),
                                    Text("Loading.",style: TextStyle(fontFamily: "composie",fontSize: 22,color: Colors.white),)
                                  ],
                                ): Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.login_outlined),
                                    SizedBox(width: 5,),
                                    Text(
                                      "Log in",
                                      style: TextStyle(
                                        fontFamily: "composie",
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(height: 20,),
                          Text("Log in with.",style: TextStyle(fontSize: 16,color: Colors.black),),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Icon(EvaIcons.google,color: Colors.black,),
                            SizedBox(width: 13,),
                            Icon(EvaIcons.facebook,color: Colors.black,),
                            SizedBox(width: 13,),
                            Icon(EvaIcons.github,color: Colors.black,),
                            SizedBox(width: 13,),
                          ],)

                        ],
                      ),
                      ))
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
