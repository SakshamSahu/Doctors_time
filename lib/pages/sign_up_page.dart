import 'package:doctors_time/pages/sign_in_page.dart';
import 'package:doctors_time/widgets/button_1.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});
  static const String routeName = "signup-page";

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
                "Sign Up",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(height: height * 0.015),
              RichText(
                text: TextSpan(
                  text: "Already have an account?",
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: " Sign In",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, SigninPage.routeName);
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.04),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username*',
                ),
              ),
              SizedBox(height: height * 0.03),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email*',
                ),
              ),
              SizedBox(height: height * 0.03),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number*',
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
              SizedBox(height: height * 0.03),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password*',
                ),
              ),
              SizedBox(height: height * 0.035),
              Center(
                child: SizedBox(
                  width: width,
                  height: height * 0.06,
                  child: CustomButton(text: "Sign Up", onPressed: () {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
