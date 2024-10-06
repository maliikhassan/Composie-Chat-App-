import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:log_in/Activities/Home.dart';
import 'package:log_in/Activities/setting.dart';
import 'package:log_in/essetials/chat_services.dart';
import 'package:log_in/essetials/firebase_auth.dart';
class Chat_Page extends StatelessWidget {
  final String recieverEmail;
  final String recieverId;
  Chat_Page({
    super.key,
    required this.recieverEmail,
    required this.recieverId,
  });
final TextEditingController _messageController = TextEditingController();

final chat_Services _chatServices = chat_Services();
final auth_Services _authServices = auth_Services();

void sendMessage()async{
  if(_messageController.text.isNotEmpty){
    await _chatServices.sendMessages(recieverId, _messageController.text);
    _messageController.clear();
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recieverEmail),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: _builtMessageList()
      ),






            _builtUserInput()


          ],
        ),
      ),
    );
  }

  Widget _builtMessageList(){
    String senderID = _authServices.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatServices.gotMessages(recieverId, senderID),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return const Text("Error.");
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Text("Loading...");
          }

          return ListView(
            children: snapshot.data!.docs.map((doc)=> _buildMessageItem(doc,context)).toList(),
          );
        }
    );
  }
  Widget _buildMessageItem(DocumentSnapshot doc, BuildContext context) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // Check if the message is from the current user
    bool isCurrentUser = data["senderID"] == _authServices.getCurrentUser()!.uid;

    // Define the alignment and color based on the sender
    var alignment = isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    var bubbleColor = isCurrentUser ? Colors.deepPurple : Colors.purpleAccent;

    return Row(
      mainAxisAlignment: isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.circular(10),
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7, // Limit width to 70% of screen width
          ),
          child: Text(
            data["message"],
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _builtUserInput(){
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(color: Colors.deepPurple,width: 1
          ),
          borderRadius: BorderRadius.all(Radius.circular(35))
      ),

      child: Row(
        children: [
          Expanded(child:
          TextField(
            controller: _messageController,
            decoration: InputDecoration(
                hintText: "Type Message..",
                hintStyle: TextStyle(
                    fontFamily: "ComposieLite2"
                ),
                border: InputBorder.none
            ),
          )
          ),
    InkWell(
      onTap: (){sendMessage();},
      child: Container(
        child: Icon(Icons.arrow_upward_outlined,color: Colors.white,),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.all(Radius.circular(30))
      ),),
    )
        ],
      ),
      height: 70,);
  }
}





























