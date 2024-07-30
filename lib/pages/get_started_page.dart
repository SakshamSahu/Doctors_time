import 'package:doctors_time/constants.dart';
import 'package:doctors_time/pages/auth/sign_in_page.dart';
import 'package:doctors_time/utils/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});
  static const String routeName = "getstarted-page";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.055, vertical: height * 0.023),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.015),
                SizedBox(
                  height: height * 0.6,
                  width: width,
                  child: Image.asset(AppAssets.doctor1),
                ),
                SizedBox(height: height * 0.03),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Lets Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.08,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.008),
                Text(
                  "Easy Way To Book and Manage Your Appointments.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: height * 0.065),
                SizedBox(
                    width: width * 0.9,
                    height: height * 0.065,
                    child: ElevatedButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, SigninPage.routeName);
                          // print(ap.isSignedIn);
                          // if (ap.isSignedIn) {
                          //   await ap.getRoleFromSP().then((value) {
                          //     if (value == 'patient') {
                          //       Navigator.pushNamed(
                          //           context, BottomNavigationExample.routeName);
                          //     } else if (value == 'doctor') {
                          //       Navigator.pushNamed(
                          //           context, DoctorHomePage.routeName);
                          //     }
                          //   });
                          // } else {
                          //   Navigator.pushNamed(context, SigninPage.routeName);
                          // }
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Get Started",
                              style: TextStyle(
                                  color: const Color(0XFF0217A8),
                                  fontSize: width * 0.052,
                                  fontWeight: FontWeight.w900),
                            ),
                            const Icon(
                              CupertinoIcons.forward,
                              color: Color(0XFF0217A8),
                            )
                          ],
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
