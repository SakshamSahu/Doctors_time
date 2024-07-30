import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_time/constants.dart';
import 'package:doctors_time/models/DoctorsModel.dart';
import 'package:doctors_time/models/UserModel.dart';
import 'package:doctors_time/pages/doctor/doctor_home_page.dart';
import 'package:doctors_time/pages/auth/otp_page.dart';
import 'package:doctors_time/pages/auth/sign_up_as.dart';
import 'package:doctors_time/services/firestore_service.dart';
import 'package:doctors_time/widgets/bottom_navigation_bar.dart';
import 'package:doctors_time/widgets/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class myAuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _uid;
  String get uid => _uid!;
  String otp = "";
  UserModel? _userModel;
  UserModel get userModel => _userModel!;
  DoctorsModel? _doctorsModel;
  DoctorsModel get doctorsModel => _doctorsModel!;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  myAuthProvider() {
    checkSign();
  }

  void checkSign() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("is_signedin") ?? false;
    notifyListeners();
  }

  Future setSignIn(String role) async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("is_signedin", true);
    s.setString("role", role);
    _isSignedIn = true;
    notifyListeners();
  }

  void onOtpChange(String value) {
    otp = value;
    notifyListeners();
  }

  //signIn
  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            await _firebaseAuth.signInWithCredential(phoneAuthCredential);
          }, //when otp verifcation is completed
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: (verificationId, forceResendingToken) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpPage(
                  verificationId: verificationId,
                ),
              ),
            );
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      customSnackBar(context, e.message.toString());
    }
  }

  //verify Otp
  void verifyOtp({
    required BuildContext context,
    required String verificationId,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      log(otp);
      log(verificationId);
      PhoneAuthCredential cred = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      User? user = (await _firebaseAuth.signInWithCredential(cred)).user!;
      if (user != null) {
        _uid = user.uid;
        final bool isOldUSer = await FirestoreService().checkUserExists(_uid!);
        if (isOldUSer) {
          String role = await FirestoreService().getRoleFromFirebase(_uid!);
          if (role == "doctor") {
            Navigator.pushNamedAndRemoveUntil(
                context, DoctorHomePage.routeName, (route) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, BottomNavigationExample.routeName, (route) => false);
          }
        } else {
          Navigator.pushNamed(context, SignUpAs.routeName);
        }
      }
      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      customSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  //Databse Operations
  //check existing user
  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot =
        await _firebaseFirestore.collection("users").doc(_uid).get();
    if (snapshot.exists) {
      print("USER_EXISTS");
      return true;
    } else {
      print("NEW_USER");
      return false;
    }
  }

  //save user data to firebase
  Future<void> saveUserDataToFirebase({
    required BuildContext context,
    required UserModel userModel,
    required File profilePic,
    required Function onSucess,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      //uploading image to firebase storage
      await storeFileToFirebase("profilePic/$_uid", profilePic).then((value) {
        userModel.profilePic = value;
        userModel.createdAt = DateTime.now().microsecondsSinceEpoch.toString();
        userModel.phonenumber = _firebaseAuth.currentUser!.phoneNumber!;
        userModel.uid = _firebaseAuth.currentUser!.uid!;
      });
      _userModel = userModel;
      //uploading to databse
      await _firebaseFirestore
          .collection("users")
          .doc(_uid)
          .set(userModel.toMap())
          .then((value) {
        onSucess();
        _isLoading = false;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      customSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  //save doctors data to firebase
  Future<void> saveDoctorsDataToFirebase({
    required BuildContext context,
    required DoctorsModel doctorsModel,
    required File profilePic,
    required Function onSucess,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      //uploading image to firebase storage
      await storeFileToFirebase("profilePic/$_uid", profilePic).then((value) {
        doctorsModel.profilePic = value;
        doctorsModel.createdAt =
            DateTime.now().microsecondsSinceEpoch.toString();
        doctorsModel.phonenumber = _firebaseAuth.currentUser!.phoneNumber!;
        doctorsModel.uid = _firebaseAuth.currentUser!.uid!;
      });
      _doctorsModel = doctorsModel;
      //uploading to databse
      await _firebaseFirestore
          .collection("users")
          .doc(_uid)
          .set(doctorsModel.toMap())
          .then((value) {
        onSucess();
        _isLoading = false;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      customSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String> storeFileToFirebase(String ref, File file) async {
    UploadTask uploadTask = _firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future getUserDataFromSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    final String? data = s.getString("user_model");
    print(data);
    if (data != null) {
      final snapshot = jsonDecode(data);
      _userModel = UserModel(
          gender: snapshot['gender'],
          firstname: snapshot['firstname'],
          lastname: snapshot['lastname'],
          age: snapshot['age'],
          address: snapshot['address'],
          city: snapshot['city'],
          pincode: snapshot['pincode'],
          email: snapshot['email'],
          phonenumber: snapshot['phonenumber'],
          uid: snapshot['uid'],
          createdAt: snapshot['createdAt'],
          profilePic: snapshot['profilePic'],
          role: snapshot['role']);
      notifyListeners();
    }
  }

  Future getUserDataFromFirestore() async {
    await _firebaseFirestore
        .collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      _userModel = UserModel(
          gender: snapshot['gender'],
          firstname: snapshot['firstname'],
          lastname: snapshot['lastname'],
          age: snapshot['age'],
          address: snapshot['address'],
          city: snapshot['city'],
          pincode: snapshot['pincode'],
          email: snapshot['email'],
          phonenumber: snapshot['phonenumber'],
          uid: snapshot['uid'],
          createdAt: snapshot['createdAt'],
          profilePic: snapshot['profilePic'],
          role: snapshot['role']);
    });
  }

  Future getDoctorsDataFromFirestore() async {
    await _firebaseFirestore
        .collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      _doctorsModel = DoctorsModel(
          firstname: snapshot['firstname'],
          lastname: snapshot['lastname'],
          clinicorhospitalname: snapshot['clinicorhospitalname'],
          clinicorhospitaladdress: snapshot['clinicorhospitaladdress'],
          clinicorhospitalcity: snapshot['clinicorhospitalcity'],
          clinicorhospitalpincode: snapshot['clinicorhospitalpincode'],
          qualificaion: snapshot['qualificaion'],
          specialization: snapshot['specialization'],
          gender: snapshot['gender'],
          age: snapshot['age'],
          email: snapshot['email'],
          phonenumber: snapshot['phonenumber'],
          uid: snapshot['uid'],
          createdAt: snapshot['createdAt'],
          profilePic: snapshot['profilePic'],
          role: snapshot['role']);
    });
  }

  //storing data locally(shared preference)
  Future saveUserDataToSP(Roles role) async {
    SharedPreferences s = await SharedPreferences.getInstance();
    if (role == Roles.patient) {
      await s.setString("user_model", jsonEncode(userModel.toMap()));
    } else {
      await s.setString("doctor_model", jsonEncode(doctorsModel.toMap()));
    }
  }

  //getting data locally(shared preference)
  Future getDataFromSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    if (s.getString('role') == 'patient') {
      String data = s.getString("user_model") ?? '';
      _userModel = UserModel.fromMap(jsonDecode(data));
      _uid = userModel.uid;
      notifyListeners();
    } else if (s.getString('role') == 'doctor') {
      String data = s.getString("doctor_model") ?? '';
      _doctorsModel = DoctorsModel.fromMap(jsonDecode(data));
      _uid = doctorsModel.uid;
      notifyListeners();
    }
  }

  Future<String?> getRoleFromSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    return s.getString("role");
  }

  Future<String> getRoleFromDatabse() async {
    DocumentSnapshot snapshot =
        await _firebaseFirestore.collection("users").doc(_uid).get();
    return snapshot['role'];
  }

  //sign out user
  Future userSignOut() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await _firebaseAuth.signOut();
    _isSignedIn = false;
    notifyListeners();
    s.clear();
  }
}
