import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServiceImpl {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<Either<String, UserCredential>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var response = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((onValue) {
            return onValue;
          });
      return right(response);
    } catch (e) {
      return left(e.toString());
    }
  }

  User? getCurrentUser() {
    return firebaseAuth.currentUser;
  }

  Future<Either<String, UserCredential>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var response = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((onValue) async {
            fireStore.collection("Users").doc(onValue.user!.uid).set({
              'uid': onValue.user!.uid,
              'email': email,
              'name': name,
            });
            return onValue;
          });
      return right(response);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
