import 'package:doctors_time/pages/doctor_home_page.dart';
import 'package:doctors_time/pages/sign_in_page.dart';
import 'package:doctors_time/provider/my_auth_provider.dart';
import 'package:doctors_time/utils/app_assets.dart';
import 'package:doctors_time/constants.dart';
import 'package:doctors_time/widgets/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});
  static const String routeName = "getstarted-page";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final ap = Provider.of<myAuthProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor2,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.035, vertical: height * 0.023),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: height * 0.02),
                SizedBox(
                  height: height * 0.68,
                  width: width,
                  child: Image.asset(AppAssets.doctor1),
                ),
                SizedBox(height: height * 0.02),
                SizedBox(
                    width: width * 0.9,
                    height: height * 0.065,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (ap.isSignedIn == true) {
                            await ap.getRoleFromSP().then((value) {
                              if (value == 'patient') {
                                Navigator.pushNamed(
                                    context, BottomNavigationExample.routeName);
                              } else if (value == 'doctor') {
                                Navigator.pushNamed(
                                    context, DoctorHomePage.routeName);
                              }
                            });
                          } else {
                            Navigator.pushNamed(context, SigninPage.routeName);
                          }
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blueAccent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Get Started",
                              style: TextStyle(
                                  fontSize: width * 0.052,
                                  fontWeight: FontWeight.w900),
                            ),
                            const Icon(CupertinoIcons.forward)
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
