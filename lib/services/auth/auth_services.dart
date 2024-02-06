
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AuthServices{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get currrent user

  User? getCurrentUser(){
    return _auth.currentUser;
  }


  //sign in
  Future<UserCredential> signInWIthMailPassword(String email, password) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);


      return userCredential;
    }on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }

  }

  //sign up
  Future<UserCredential> signUpWithMailPass(String email, password, userName) async{
    try{
      UserCredential credential =
        await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password);

      //save info in firestore

      await _firestore.collection("Users").doc(credential.user!.uid).set({
        'uid': credential.user!.uid,
        'email': email,
        'username': userName
      });

      return credential;
    }on Error catch (e){
      throw Exception(e.toString());
    }

  }

  //sign out
  Future<void> signOut()async {
    await _auth.signOut();
  }

  //errors

  //isLogin ?
  bool isLogin(BuildContext context){
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if(user != null){
      return false;

    }
    else{
      return true;

    }

  }

}