import 'dart:async';

import 'package:f_firebase/ui/auth/login/login.dart';
import 'package:f_firebase/ui/home/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Splashservices {
  void Login(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;

    if (user != null) {
      Timer(Duration(seconds: 3), () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen()));
      });
    }
  }
}
