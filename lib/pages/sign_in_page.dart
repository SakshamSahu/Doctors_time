import 'package:doctors_time/pages/sign_up_page.dart';
import 'package:doctors_time/widgets/bottom_navigation_bar.dart';
import 'package:doctors_time/widgets/button_1.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});
  static const String routeName = "signin-page";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.035, vertical: height * 0.023),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.01),
              const Text(
                "Sign In",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(height: height * 0.015),
              // const Text(
              //   "Don't have an account? Sign Up",
              //   style: TextStyle(fontSize: 15),
              // ),
              RichText(
                text: TextSpan(
                  text: "Don't have an account?",
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: " Sign Up!",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, SignupPage.routeName);
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.04),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email*',
                ),
              ),
              SizedBox(height: height * 0.03),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password*',
                ),
              ),
              SizedBox(height: height * 0.02),
              InkWell(
                onTap: () {},
                child: const Text(
                  "Forgot your password?",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              SizedBox(height: height * 0.035),
              Center(
                child: SizedBox(
                  width: width,
                  height: height * 0.06,
                  child: CustomButton(
                    text: "Sign In",
                    onPressed: () {
                      Navigator.pushNamed(
                          context, BottomNavigationExample.routeName);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
