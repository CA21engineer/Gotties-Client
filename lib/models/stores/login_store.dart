import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginStore with ChangeNotifier {
  LoginStore() {
    _setCurrentUser();
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser user;

  Future<void> _setCurrentUser() async {
    user = await _auth.currentUser();
    notifyListeners();
  }

  bool get isLoggedIn => user != null;

  Future<void> login() async {
    try {
      final account = await _googleSignIn.signIn();
      final auth = await account.authentication;
      final credential = GoogleAuthProvider.getCredential(
        idToken: auth.idToken,
        accessToken: auth.accessToken,
      );
      user = (await _auth.signInWithCredential(credential)).user;
      notifyListeners();
    } on Exception catch (error) {
      debugPrint('[ERROR] $error');
    }
  }

  Future<void> loginAnonymously() async {
    try {
      await _auth.signInAnonymously();
    } on Exception catch (e) {
      debugPrint('[ERROR] $e');
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    user = await _auth.currentUser();
    notifyListeners();
  }
}
