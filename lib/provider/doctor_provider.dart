import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_time/models/DoctorsModel.dart';
import 'package:doctors_time/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class DoctorProvider extends ChangeNotifier {
  DoctorsModel? _doctorsModel;
  DoctorsModel? get doctorModel => _doctorsModel;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  doctorsinit() async {
    final DocumentSnapshot documentSnapshot = await FirestoreService()
        .getUserDataFromFirestore(_firebaseAuth.currentUser!.uid);
    _doctorsModel =
        DoctorsModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
    notifyListeners();
  }
}
