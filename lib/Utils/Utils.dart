import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UTils {
  void Toastmsg(String msg, Color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 5,
        backgroundColor: Color,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
