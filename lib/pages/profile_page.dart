import 'dart:io';

import 'package:doctors_time/constants.dart';
import 'package:doctors_time/pages/sign_in_page.dart';
import 'package:doctors_time/provider/my_auth_provider.dart';
import 'package:doctors_time/widgets/button_1.dart';
import 'package:doctors_time/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static const String routeName = "profile-page";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final ap = Provider.of<myAuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: bgcolor2,
      body: SafeArea(
        child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.023, horizontal: width * 0.035),
            physics: const BouncingScrollPhysics(),
            child: Builder(builder: (context) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Icon(
                            Icons.menu,
                            size: width * 0.08,
                          )),
                      SizedBox(
                        width: width * 0.28,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: width * 0.31,
                      ),
                      Icon(
                        CupertinoIcons.settings,
                        size: width * 0.076,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.05),
                  InkWell(
                    onTap: () {
                      // pickImage();
                    },
                    child: CircularPercentIndicator(
                      radius: 69.0,
                      lineWidth: 10.0,
                      animation: true,
                      percent: 1,
                      center: CircleAvatar(
                          radius: 60, // Image radius
                          backgroundImage:
                              NetworkImage(ap.userModel.profilePic)),
                      progressColor: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                  Text(
                    "${ap.userModel.firstname} ${ap.userModel.lastname}",
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ap.userModel.email,
                    style: TextStyle(
                        fontSize: width * 0.038, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: height * 0.025),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(10)),
                    height: height * 0.06,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Personal Info",
                            style: TextStyle(fontSize: width * 0.037),
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: width * 0.08,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(10)),
                    height: height * 0.06,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Medical Info",
                            style: TextStyle(fontSize: width * 0.037),
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: width * 0.08,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(10)),
                    height: height * 0.06,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Previous Appointments",
                            style: TextStyle(fontSize: width * 0.037),
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: width * 0.08,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(10)),
                    height: height * 0.06,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Help & FAQ",
                            style: TextStyle(fontSize: width * 0.037),
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: width * 0.08,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                  CustomButton(
                      text: "Log out",
                      onPressed: () {
                        ap.userSignOut().then((value) =>
                            Navigator.pushNamed(context, SigninPage.routeName));
                      })
                ],
              );
            })),
      ),
      drawer: MyDrawer(
          name: "${ap.userModel.firstname} ${ap.userModel.lastname}",
          email: ap.userModel.email),
    );
  }
}
