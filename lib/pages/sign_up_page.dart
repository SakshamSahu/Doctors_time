import 'package:country_picker/country_picker.dart';
import 'package:doctors_time/pages/otp_page.dart';
import 'package:doctors_time/pages/sign_in_page.dart';
import 'package:doctors_time/widgets/button_1.dart';
import 'package:doctors_time/widgets/custom_textformfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static const String routeName = "signup-page";

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final TextEditingController usernameController = TextEditingController();
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.035, vertical: height * 0.023),
          child: SingleChildScrollView(
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
                customTextFormField(context, "Username*", usernameController),
                SizedBox(height: height * 0.03),
                customTextFormField(context, "Email*", usernameController),
                SizedBox(height: height * 0.03),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Enter phone number",
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                              context: context,
                              countryListTheme: const CountryListThemeData(
                                bottomSheetHeight: 550,
                              ),
                              onSelect: (value) {
                                setState(() {
                                  selectedCountry = value;
                                });
                              });
                        },
                        child: Text(
                          "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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
                    child: CustomButton(
                        text: "Sign Up",
                        onPressed: () {
                          Navigator.pushNamed(context, OtpPage.routeName);
                        }),
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
