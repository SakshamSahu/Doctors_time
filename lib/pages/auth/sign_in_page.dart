import 'package:country_picker/country_picker.dart';
import 'package:doctors_time/pages/auth/sign_up_page_patient.dart';
import 'package:doctors_time/provider/my_auth_provider.dart';
import 'package:doctors_time/widgets/button_1.dart';
import 'package:doctors_time/widgets/custom_snackbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});
  static const String routeName = "signin-page";

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
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

  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.035, vertical: height * 0.023),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.01),
              const Text(
                "Sign In",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              SizedBox(height: height * 0.015),
              const Text(
                "Enter Phone Number to Get Started",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: height * 0.03),
              TextFormField(
                controller: phoneController,
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
              Center(
                child: SizedBox(
                  width: width,
                  height: height * 0.06,
                  child: CustomButton(
                    text: "Sign In",
                    onPressed: () {
                      sendPhoneNumber();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendPhoneNumber() {
    final ap = Provider.of<myAuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    if (phoneNumber.isEmpty) {
      customSnackBar(context, "Phone number cannot be empty");
    } else if (phoneNumber.length != 10) {
      customSnackBar(context, "Please enter a valid 10-digit phone number");
    } else {
      ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
    }
  }
}
