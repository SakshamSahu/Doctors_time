import 'dart:developer';

import 'package:doctors_time/provider/my_auth_provider.dart';
import 'package:doctors_time/widgets/button_1.dart';
import 'package:doctors_time/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatefulWidget {
  final String verificationId;
  const OtpPage({super.key, required this.verificationId});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  //static const String routeName = "otp-page";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final ref = Provider.of<myAuthProvider>(context, listen: true);
    final controller = Provider.of<myAuthProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: ref.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * .01, horizontal: width * .06),
                child: Column(
                  children: [
                    Container(
                      width: width * 0.5,
                      height: height * 0.3,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.shade50,
                      ),
                      child: Image.asset(
                        "assets/images/verification.png",
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    const Text(
                      "Verification",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Enter the OTP send to your phone number",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.03),
                    Pinput(
                      length: 6,
                      showCursor: true,
                      onCompleted: (value) {
                        controller.onOtpChange(value);
                      },
                      defaultPinTheme: PinTheme(
                          width: width * 0.13,
                          height: height * 0.075,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue),
                          ),
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: height * 0.03),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: height * 0.06,
                      child: CustomButton(
                        text: "Verify",
                        onPressed: () {
                          log("optscreen${ref.otp}");
                          if (ref.otp.isNotEmpty) {
                            controller.verifyOtp(
                                context: context,
                                verificationId: widget.verificationId);
                          } else {
                            customSnackBar(context, "Enter 6-Digit Code");
                          }
                        },
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    const Text(
                      "Didn't receive any code?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    const Text(
                      "Resend New Code",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
