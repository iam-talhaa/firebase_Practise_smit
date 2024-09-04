import 'package:f_firebase/Custom_widgets/custom_button.dart';
import 'package:f_firebase/ui/auth/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Email';
                  }
                },
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                },
                obscureText: true,
                obscuringCharacter: "#",
                keyboardType: TextInputType.text,
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password"),
              ),
              Divider(),
              Row(
                children: [
                  Text("Don't Have an Account"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => signUpScreen()));
                      },
                      child: Text("Sign Up"))
                ],
              ),
              Custom_button(
                  B_color: Colors.black,
                  ontap: () {
                    print("CHECHEK");
                  },
                  B_text: "Login ",
                  B_height: 45.h,
                  B_width: 150.h)
            ],
          ),
        ),
      ),
    );
  }
}
