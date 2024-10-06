import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:log_in/Models/message.dart';

class chat_Services{
  //instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //User Stream

  Stream<List<Map<String,dynamic>>> getUserStream(){
    return _firestore.collection("Users").snapshots().map((snapshots){
      return snapshots.docs.map((doc){
        final user = doc.data();

        return user;
      }).toList();
    });
  }
  //send message
  Future<void> sendMessages(String recieverId,message) async {
    // Getting User Information
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //Creat a new Message
    messages newMessage =messages(
        senderID: currentUserId,
        senderEmail: currentUserEmail,
        recieverID: recieverId,
        message_p: message,
        timeNow: timestamp
    );
    // Creating Chat Room
    List<String> ids = [currentUserId,recieverId];
    ids.sort();
    String chatroomID = ids.join("_");
    //add message to data base
    await _firestore.collection("chat_rooms").doc(chatroomID).collection("messages").add(newMessage.toMap());
  }
  //recieve message
  Stream<QuerySnapshot> gotMessages(String userId,otherUserId){
    List<String> ids = [userId,otherUserId];
    ids.sort();
    String chatRoomID = ids.join("_");
    return _firestore.collection("chat_rooms").doc(chatRoomID).collection("messages").orderBy("time",descending: false).snapshots();
  }
}



























