import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:log_in/Activities/setting.dart';
import 'package:log_in/UI/user_tile.dart';
import 'package:log_in/essetials/chat_services.dart';

import 'package:log_in/essetials/firebase_auth.dart';

import 'chatPage.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final chat_Services _chatServices = chat_Services();
  final auth_Services _authServices = auth_Services();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 35,left: 10,right: 10,bottom: 10),
              color: Colors.deepPurple,
              child: Row(
                children: [
                      Expanded(child: Text("Chat Box",style: TextStyle(fontFamily: "composie",fontWeight: FontWeight.w600,color: Colors.white,fontSize: 20),)),
                  IconButton(onPressed: (){
                    Get.to(Settings_Activity(),transition: Transition.rightToLeft,duration: Duration(seconds: 1));
                    }, icon: Icon(Icons.person,color: Colors.white,))
                ],
              ),
            ),
            Expanded(
              child: _buildUserList(), // Add the user list here
            ),
          ],
        ),
      )
    );
  }
  Widget _buildUserList(){
    return StreamBuilder(
        stream: _chatServices.getUserStream(),
        builder: (context,snapshots){
          if(snapshots.hasError){
            return const Text("Error.");
          }
          if(snapshots.connectionState == ConnectionState.waiting){
            return const Text("Loading...");
          }

          return ListView(
            children: snapshots.data!.map<Widget>((userData)=>_buildUserListItem(userData,context)).toList(),
          );


        }
    );
  }
  Widget _buildUserListItem(Map<String,dynamic> userData,BuildContext context){
    if(userData["email"] != _authServices.getCurrentUser()!.email){
      return UserTile(
        text: userData["email"],
        onTap: (){
          Get.to(Chat_Page(
            recieverEmail: userData["email"],
            recieverId: userData["uid"],
          ));
        },

      );
    }else{
      return Container();
    }
  }
}