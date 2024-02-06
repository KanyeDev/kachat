import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kachat/services/auth/auth_services.dart';
import 'package:kachat/pages/auth/login.dart';

import '../home/home_page.dart';

class LoginOrSignUp extends StatefulWidget {
  const LoginOrSignUp({super.key});

  @override
  State<LoginOrSignUp> createState() => _LoginOrSignUpState();
}

class _LoginOrSignUpState extends State<LoginOrSignUp> {
  bool isLoggedIn = false;
  final authS = AuthServices();

  void isLogin(){
    if(isLoggedIn == false){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage()));

    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginPage()));

    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoggedIn = authS.isLogin(context);
    });
  }


  @override
  Widget build(BuildContext context) {
    if(isLoggedIn == false){
      return  HomePage();
    }
    else{
      return LoginPage();
    }
  }
}
