import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_time/models/UserModel.dart';
import 'package:doctors_time/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class PatientProvider extends ChangeNotifier {
  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  pateintInit() async {
    final DocumentSnapshot documentSnapshot = await FirestoreService()
        .getUserDataFromFirestore(_firebaseAuth.currentUser!.uid);
    _userModel =
        UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
    notifyListeners();
  }
}
