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

  final FirebaseRef = FirebaseDatabase.instance.ref('counter');
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("object");
    print("object");
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut().then((v) {
                  UTils().Toastmsg("Logout Successfully", Colors.green);

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()));
                }).onError((Error, s) {
                  UTils().Toastmsg(Error.toString(), Colors.red);
                });
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                _auth.currentUser!.delete().then((c) {
                  UTils().Toastmsg("User Deleted Successfully", Colors.green);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => signUpScreen()));
                }).onError((Error, s) {
                  UTils().Toastmsg(Error.toString(), Colors.red);
                });
              },
              icon: Icon(
                Icons.delete,
                color: Colors.black,
              )),
        ],
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: "Enter your Name"),
          ),
          Center(
            child: Custom_button(
                B_color: Colors.black,
                ontap: () {
                  final id = DateTime.now().millisecond.toString();
                  FirebaseRef.child(id).set({
                    'id': id.toString(),
                    'Name': nameController.toString().trim(),
                    'Department': 'Software Engineering'
                  }).then((v) {
                    UTils().Toastmsg("ADDED SuccessFull", Colors.green);
                  }).onError((Error, s) {
                    UTils().Toastmsg(Error.toString(), Colors.red);
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
