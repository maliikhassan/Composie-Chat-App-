import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class auth_Services{
  //instance of Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Fetching Current User
  User? getCurrentUser(){
    return _auth.currentUser;
  }
  //Login
  Future<UserCredential> signInWithEmailPassword(String email,password) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      //Saving User Data
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
          {
            "uid" : userCredential.user!.uid,
            "email" : email
          }
      );
      //Saving User Data
      return userCredential;
    } on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }
  //SugnUP ---- Creating a New User

  Future<UserCredential> signUpWithNameEmailPassword(String email,password) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      //Saving User Data
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          "uid" : userCredential.user!.uid,
          "email" : email
        }
      );
      //Saving User Data
      return userCredential;
    } on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }

  }

  
  //Logout
  Future<void> signOUT() async{
    return await _auth.signOut();
  }
  //Error
}