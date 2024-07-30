import 'package:doctors_time/pages/auth/sign_in_page.dart';
import 'package:doctors_time/provider/doctor_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({super.key});

  static const String routeName = "doctor-home-page";

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  @override
  void initState() {
    Provider.of<DoctorProvider>(context, listen: false).doctorsinit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ref = Provider.of<DoctorProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.blue,
      body: ref.doctorModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: TextButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    // SharedPreferences sharedPreferences =
                    //     await SharedPreferences.getInstance();
                    // sharedPreferences.clear();
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
