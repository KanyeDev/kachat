import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utility {

  void toastMessage(String message) {
    Fluttertoast.showToast(msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      webPosition: "center",
      webShowClose: true,
      backgroundColor: const Color(0xff2E3F7A),
      textColor: Colors.white,
      fontSize: 32.0,);
  }

}