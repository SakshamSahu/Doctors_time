import 'package:doctors_time/pages/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorHomePage extends StatelessWidget {
  const DoctorHomePage({super.key});

  static const String routeName = "doctor-home-page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.clear();
              Navigator.pushNamedAndRemoveUntil(
                  context, SigninPage.routeName, (route) => false);
            },
            child: Text(
              "Log out",
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
