import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Authentication with ChangeNotifier {
  late String uid;
  // Authentication(@required this.uid);
  String get getUid => uid;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future loginIntoAccount(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user!;
    uid = user.uid;
    print('this is out uid => $getUid');
    notifyListeners();
  }

  Future createNewAccount(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user!;
    uid = user.uid;
    print('this is out uid => $getUid');
    notifyListeners();
  }
}