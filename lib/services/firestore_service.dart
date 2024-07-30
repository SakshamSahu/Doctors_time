import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String> getRoleFromFirebase(String uid) async {
    final DocumentSnapshot snapshot =
        await _firebaseFirestore.collection("users").doc(uid).get();
    return snapshot['role'];
  }

  Future<DocumentSnapshot> getUserDataFromFirestore(String uid) async {
    final DocumentSnapshot snapshot =
        await _firebaseFirestore.collection("users").doc(uid).get();
    return snapshot;
  }

  Future<bool> checkUserExists(String uid) async {
    final DocumentSnapshot snapshot =
        await _firebaseFirestore.collection("users").doc(uid).get();
    return snapshot.exists;
  }
}
