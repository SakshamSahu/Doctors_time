import 'dart:io';
import 'package:doctors_time/components/pick_image.dart';
import 'package:doctors_time/constants.dart';
import 'package:doctors_time/models/UserModel.dart';
import 'package:doctors_time/pages/auth/sign_in_page.dart';
import 'package:doctors_time/provider/my_auth_provider.dart';
import 'package:doctors_time/widgets/bottom_navigation_bar.dart';
import 'package:doctors_time/widgets/button_1.dart';
import 'package:doctors_time/widgets/custom_snackbar.dart';
import 'package:doctors_time/widgets/custom_textformfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static const String routeName = "signup-page";

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  File? image;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();

    addressController.dispose();
    emailController.dispose();
    ageController.dispose();
    cityController.dispose();
    pincodeController.dispose();
  }

  //for selecting image
  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final ref = Provider.of<myAuthProvider>(context, listen: true);
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
                    horizontal: width * 0.035, vertical: height * 0.023),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.006),
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(height: height * 0.015),
                      RichText(
                        text: TextSpan(
                          text: "Already have an account?",
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: " Sign In",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, SigninPage.routeName);
                                },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Center(
                        child: InkWell(
                          onTap: () => selectImage(),
                          child: image == null
                              ? CircleAvatar(
                                  backgroundColor: Colors.blue.shade50,
                                  radius: width * 0.12,
                                  child: Icon(
                                    Icons.account_circle,
                                    size: width * 0.16,
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundImage: FileImage(image!),
                                  backgroundColor: Colors.blue.shade50,
                                  radius: width * 0.12,
                                ),
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      customTextFormField(
                          context, "First name*", firstNameController),
                      SizedBox(height: height * 0.03),
                      customTextFormField(
                          context, "Last name*", lastNameController),
                      SizedBox(height: height * 0.03),
                      customTextFormField(context, "Gender*", genderController),
                      SizedBox(height: height * 0.03),
                      customTextFormField(context, "Age", ageController),
                      SizedBox(height: height * 0.03),
                      customTextFormField(
                          context, "Address*", addressController),
                      SizedBox(height: height * 0.03),
                      customTextFormField(context, "City*", cityController),
                      SizedBox(height: height * 0.03),
                      customTextFormField(
                          context, "Pincode*", pincodeController),
                      SizedBox(height: height * 0.03),
                      customTextFormField(context, "Email*", emailController),
                      SizedBox(height: height * 0.03),
                      Center(
                        child: SizedBox(
                          width: width,
                          height: height * 0.06,
                          child: CustomButton(
                              text: "Sign Up",
                              onPressed: () {
                                storeData();
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

  //store user data to databse
  void storeData() async {
    final ap = Provider.of<myAuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      firstname: firstNameController.text.trim(),
      lastname: lastNameController.text.trim(),
      age: ageController.text.trim(),
      address: addressController.text.trim(),
      email: emailController.text.trim(),
      gender: genderController.text.trim(),
      phonenumber: "",
      uid: "",
      createdAt: "",
      profilePic: "",
      role: 'patient',
      city: cityController.text.trim(),
      pincode: pincodeController.text.trim(),
    );
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        ageController.text.isEmpty ||
        addressController.text.isEmpty ||
        emailController.text.isEmpty ||
        genderController.text.isEmpty ||
        cityController.text.isEmpty ||
        pincodeController.text.isEmpty) {
      customSnackBar(context, "Please fill in all fields");
    } else if (image != null) {
      ap.saveUserDataToFirebase(
          context: context,
          userModel: userModel,
          profilePic: image!,
          onSucess: () {
            ap.saveUserDataToSP(Roles.patient).then(
                  (value) => ap.setSignIn("patient").then(
                        (value) => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BottomNavigationExample()),
                            (route) => false),
                      ),
                );
          });
    } else {
      customSnackBar(context, "Please Upload Your Profile Picture");
    }
  }
}
