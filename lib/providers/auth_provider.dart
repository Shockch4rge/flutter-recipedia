import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_recipedia/models/user.dart' as local;

// unimplemented in the app
class AuthProvider with ChangeNotifier {
  final auth.FirebaseAuth _firebaseAuth;
  late final local.User user;

  AuthProvider(this._firebaseAuth);

  Stream<auth.User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<auth.UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    final credentials = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credentials;
  }

  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "signed up";
    } on auth.FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future<String> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return "signed out";
    } on auth.FirebaseAuthException catch (e) {
      return e.message!;
    }
  }
}
