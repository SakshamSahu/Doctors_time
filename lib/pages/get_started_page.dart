import 'package:doctors_time/pages/sign_in_page.dart';
import 'package:doctors_time/pages/sign_up_page.dart';
import 'package:doctors_time/utils/app_assets.dart';
import 'package:doctors_time/widgets/button_1.dart';
import 'package:doctors_time/constants.dart';
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
        backgroundColor: bgcolor,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.035, vertical: height * 0.023),
            child: Column(
              children: [
                SizedBox(height: height * 0.02),
                SizedBox(
                  height: height * 0.64,
                  width: width,
                  child: Image.asset(AppAssets.doctor1),
                ),
                SizedBox(height: height * 0.06),
                SizedBox(
                  width: width * 0.9,
                  height: height * 0.065,
                  child: CustomButton(
                    text: "Sign Up",
                    onPressed: () {
                      Navigator.pushNamed(context, SignupPage.routeName);
                    },
                  ),
                ),
                SizedBox(height: height * 0.02),
                SizedBox(
                  width: width * 0.9,
                  height: height * 0.065,
                  child: CustomButton(
                    text: "Sign In",
                    onPressed: () {
                      Navigator.pushNamed(context, SigninPage.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
