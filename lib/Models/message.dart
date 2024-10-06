import 'package:cloud_firestore/cloud_firestore.dart';

class messages{
  final String senderID;
  final String senderEmail;
  final String recieverID;
  final String message_p;
  final Timestamp timeNow;

  messages({
    required this.senderID,
    required this.senderEmail,
    required this.recieverID,
    required this.message_p,
    required this.timeNow,
});

  Map<String ,dynamic> toMap(){
    return{
      "senderID": senderID,
      "senderEmail":senderEmail,
      "recieverID":recieverID,
      "message":message_p,
      "time":timeNow,
    };
  }
}