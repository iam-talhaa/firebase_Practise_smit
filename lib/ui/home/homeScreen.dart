import 'dart:async';

import 'package:f_firebase/Custom_widgets/custom_button.dart';
import 'package:f_firebase/Utils/Utils.dart';
import 'package:f_firebase/ui/auth/login/login.dart';
import 'package:f_firebase/ui/auth/signup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseRef = FirebaseDatabase.instance.ref('DataBase');
  TextEditingController nameController = TextEditingController();
  void Delete_Account() {
    _auth.currentUser!.delete().then((c) {
      UTils().Toastmsg("User Deleted Successfully", Colors.green);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => signUpScreen()));
    }).onError((Error, s) {
      UTils().Toastmsg(Error.toString(), Colors.red);
    });
  }

  void SignOut_Account() {
    _auth.signOut().then((v) {
      UTils().Toastmsg("Logout Successfully", Colors.green);

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    }).onError((Error, s) {
      UTils().Toastmsg(Error.toString(), Colors.red);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: Text("Home Screen"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                SignOut_Account();
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                Delete_Account();
              },
              icon: Icon(
                Icons.delete,
                color: Colors.black,
              )),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Enter your Name"),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Custom_button(
                B_color: Colors.black,
                ontap: () {
                  print('Firebase Checking');
                  final id = DateTime.now().millisecondsSinceEpoch.toString();
                  print(id);
                  FirebaseRef.child(id).set({
                    'id': id,
                    'Name': nameController.text.toString()
                  }).then((value) {
                    print('Then');
                    UTils().Toastmsg('POST ADDDED', Colors.green);
                  }).onError((error, stackTrace) {
                    print('ONerror');
                    UTils().Toastmsg(error.toString(), Colors.red);
                  });
                },
                B_text: "Task added",
                B_height: 40.h,
                B_width: 200.h),
          )
        ],
      ),
    );
  }
}
