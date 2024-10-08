import 'package:f_firebase/Custom_widgets/custom_button.dart';
import 'package:f_firebase/Utils/Utils.dart';
import 'package:f_firebase/ui/auth/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({
    super.key,
  });

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  TextEditingController EmailContorller = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;

  void Signup() {
    _auth
        .createUserWithEmailAndPassword(
            email: EmailContorller.text.toString().trim(),
            password: PasswordController.text.toString().trim())
        .then((v) {
      UTils().Toastmsg("SignUp SuccessFul", Colors.green);
    }).onError(
      (error, stackTrace) {
        UTils().Toastmsg(error.toString(), Colors.red);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: Text("SignUp Screen"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                style: TextStyle(color: Colors.black),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Email';
                  }
                },
                keyboardType: TextInputType.emailAddress,
                controller: EmailContorller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                    prefixIcon: Icon(Icons.mail),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.black)),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                },
                obscureText: true,
                obscuringCharacter: "#",
                keyboardType: TextInputType.text,
                controller: PasswordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password"),
              ),
              SizedBox(
                height: 40.h,
              ),
              Custom_button(
                B_color: Colors.black,
                ontap: () {
                  if (_formkey.currentState!.validate()) {
                    Signup();
                  }
                },
                B_text: 'Sign UP',
                B_height: 40.h,
                B_width: 150.w,
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have an Account",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen()));
                      },
                      child: Text("Login"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
