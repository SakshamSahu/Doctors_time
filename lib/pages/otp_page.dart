import 'package:doctors_time/widgets/button_1.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});
  static const String routeName = "otp-page";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                  onPressed: () {},
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
