import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:log_in/Activities/Home.dart';
import 'package:log_in/Activities/logIn.dart';
import 'package:log_in/essetials/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  var isLoading = false;
  @override
  void dispose() {

    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void sign_UP(BuildContext context){
    final _auth = auth_Services();
    if (_passwordController.text == _confirmPasswordController.text){
      try{
        _auth.signUpWithNameEmailPassword(_emailController.text, _passwordController.text);
        Get.to(HomePage());

      } catch(e){
        showDialog(context: context, builder: (context)=>AlertDialog(
          title: Text(e.toString()),
        ));
      }
    }else{
      showDialog(context: context, builder: (context)=>AlertDialog(
        icon: Icon(Icons.warning),

        title: Text("Both Password Should be same"),
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
              color: Colors.deepPurple,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 60,),
                    Text("Sign up",style: TextStyle(fontSize: 35,fontFamily: "Composie",color: Colors.white),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(color: Colors.white,height: 5,width: 94,),
                        SizedBox(width: 5,),
                        Container(color: Colors.purpleAccent,height: 5,width: 5,),
                        SizedBox(width: 5,),
                        Container(color: Colors.purpleAccent,height: 5,width: 5,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
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
                                  border: Border.all(width: 1,color: Colors.deepPurple),
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.all(Radius.circular(40))
                              ),
                              child: Column(
                                children: [

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
                                        Icon(Icons.email,color: Colors.deepPurple,),
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
                                        Icon(Icons.key,color: Colors.deepPurple,),
                                        SizedBox(width: 10,),
                                        Expanded(child:
                                        TextField(
                                          obscureText: true,
                                          controller: _passwordController,
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
                                  const SizedBox(height: 12,),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10,),
                                        Icon(Icons.key,color: Colors.deepPurple,),
                                        SizedBox(width: 10,),
                                        Expanded(child:
                                        TextField(
                                          obscureText: true,
                                          controller: _confirmPasswordController,
                                          decoration: InputDecoration(

                                              hintText: "Confirm Your Password.",
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
                                Text("Already have account!.",style: TextStyle(fontSize: 16,color: Colors.black),),
                                SizedBox(width: 10,),
                                InkWell(
                                    onTap: (){
                                      Get.to(LoginScreen(),transition: Transition.leftToRight,duration: Duration(seconds: 1));
                                    },
                                    child: Text("Log in",style: TextStyle(fontSize: 16,color: Colors.deepPurple),)),

                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: 200,
                              height: 50,
                              //color: Colors.purpleAccent,
                              child: ElevatedButton(
                                  style: ButtonStyle(

                                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
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
                                    sign_UP(context);
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
                                      Icon(Icons.door_back_door_outlined),
                                      SizedBox(width: 5,),
                                      Text(
                                        "Sign up",
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
                              ],),
                            SizedBox(height: 50,)

                          ],
                                                ),
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
