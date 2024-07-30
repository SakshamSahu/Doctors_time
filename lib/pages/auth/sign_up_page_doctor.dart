import 'dart:io';

import 'package:doctors_time/components/pick_image.dart';
import 'package:doctors_time/constants.dart';
import 'package:doctors_time/models/DoctorsModel.dart';
import 'package:doctors_time/pages/doctor/doctor_home_page.dart';
import 'package:doctors_time/pages/auth/sign_in_page.dart';
import 'package:doctors_time/provider/my_auth_provider.dart';
import 'package:doctors_time/widgets/button_1.dart';
import 'package:doctors_time/widgets/custom_snackbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPageDoctor extends StatefulWidget {
  const SignupPageDoctor({super.key});
  static const String routeName = "signup-page-doctor";

  @override
  State<SignupPageDoctor> createState() => _SignupPageDoctorState();
}

class _SignupPageDoctorState extends State<SignupPageDoctor> {
  File? image;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController specializationController =
      TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController clinicorhospitalnameController =
      TextEditingController();
  final TextEditingController clinicorhospitalcityController =
      TextEditingController();
  final TextEditingController clinicorhospitalpincodeController =
      TextEditingController();
  final TextEditingController clinicorhospitaladdressController =
      TextEditingController();
  //for selecting image
  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

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
                TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Firstname*',
                  ),
                ),
                SizedBox(height: height * 0.03),
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'lastname*',
                  ),
                ),
                SizedBox(height: height * 0.03),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email*',
                  ),
                ),
                SizedBox(height: height * 0.03),
                TextFormField(
                  controller: genderController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Gender*',
                  ),
                ),
                SizedBox(height: height * 0.03),
                TextFormField(
                  controller: clinicorhospitalnameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Clinic/Hospital Name*',
                  ),
                ),
                SizedBox(height: height * 0.03),
                TextFormField(
                  controller: clinicorhospitaladdressController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Clinic/Hospital Address*',
                  ),
                ),
                SizedBox(height: height * 0.03),
                TextFormField(
                  controller: clinicorhospitalcityController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Clinic/Hospital City*',
                  ),
                ),
                SizedBox(height: height * 0.03),
                TextFormField(
                  controller: clinicorhospitalpincodeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Clinic/Hospital Pincode*',
                  ),
                ),
                SizedBox(height: height * 0.03),
                TextFormField(
                  controller: qualificationController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Qualification*',
                  ),
                ),
                SizedBox(height: height * 0.03),
                TextFormField(
                  controller: specializationController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Specialization*',
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
    DoctorsModel doctorsModel = DoctorsModel(
      role: "doctor",
      firstname: firstNameController.text.trim(),
      lastname: lastNameController.text.trim(),
      age: ageController.text.trim(),
      email: emailController.text.trim(),
      phonenumber: "",
      uid: "",
      createdAt: "",
      qualificaion: qualificationController.text.trim(),
      profilePic: "",
      clinicorhospitalname: clinicorhospitalnameController.text.trim(),
      gender: genderController.text.trim(),
      clinicorhospitaladdress: clinicorhospitaladdressController.text.trim(),
      clinicorhospitalcity: clinicorhospitalcityController.text.trim(),
      clinicorhospitalpincode: clinicorhospitalpincodeController.text.trim(),
      specialization: specializationController.text.trim(),
    );
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        genderController.text.isEmpty ||
        clinicorhospitalnameController.text.isEmpty ||
        clinicorhospitaladdressController.text.isEmpty ||
        clinicorhospitalcityController.text.isEmpty ||
        clinicorhospitalpincodeController.text.isEmpty ||
        qualificationController.text.isEmpty ||
        specializationController.text.isEmpty) {
      customSnackBar(context, "Please fill in all fields");
    } else if (image != null) {
      ap.saveDoctorsDataToFirebase(
        context: context,
        doctorsModel: doctorsModel,
        profilePic: image!,
        onSucess: () {
          ap.saveUserDataToSP(Roles.doctor).then(
                (value) => ap.setSignIn("doctor").then(
                      (value) => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoctorHomePage(),
                        ),
                        (route) => false,
                      ),
                    ),
              );
        },
      );
    } else {
      customSnackBar(context, "Please Upload Your Profile Picture");
    }
  }
}
