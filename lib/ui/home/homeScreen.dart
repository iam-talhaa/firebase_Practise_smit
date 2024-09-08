import 'package:f_firebase/Utils/Utils.dart';
import 'package:f_firebase/ui/auth/login/login.dart';
import 'package:f_firebase/ui/auth/signup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
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
                  UTils().Toastmsg("Logout Successfully");

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()));
                }).onError((Error, s) {
                  UTils().Toastmsg(Error.toString());
                });
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                _auth.currentUser!.delete().then((c) {
                  UTils().Toastmsg("User Deleted Successfully");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => signUpScreen()));
                }).onError((Error, s) {
                  UTils().Toastmsg(Error.toString());
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
          Text(
            "Home Screen ",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          )
        ],
      ),
    );
  }
}
