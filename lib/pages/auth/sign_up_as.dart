import 'package:doctors_time/pages/auth/sign_up_page_patient.dart';
import 'package:doctors_time/pages/auth/sign_up_page_doctor.dart';
import 'package:doctors_time/utils/app_assets.dart';
import 'package:flutter/material.dart';

class SignUpAs extends StatelessWidget {
  SignUpAs({super.key});
  static const String routeName = "signupas-page";

  final List<String> images = [
    AppAssets.patient01,
    AppAssets.doctor2,
  ];
  final roles = [
    "Patient",
    "Doctor",
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * .02, horizontal: width * .06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.28),
              const Center(
                child: Text(
                  "Register As",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: height * 0.01),
              SizedBox(
                width: double.infinity,
                height: height * 0.5,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 40,
                  ),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.pushNamed(context, SignupPage.routeName);
                        } else if (index == 1) {
                          Navigator.pushNamed(
                              context, SignupPageDoctor.routeName);
                        }
                      },
                      child: Container(
                        width: width * 0.55,
                        decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(images[index]),
                          ),
                        ),
                        alignment: Alignment
                            .bottomCenter, // This aligns the child of the container
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom:
                                  0.0), //some spacing to the child from bottom
                          child: Container(
                            width: double.infinity,
                            height: height,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              // borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                child: Text(
                                  roles[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      fontSize: 30),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
