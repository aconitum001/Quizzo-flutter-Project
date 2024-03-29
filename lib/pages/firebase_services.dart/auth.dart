// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';

Future<void> addUser(String email, password) async {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
}

Future<void> signInUser(email, password) async {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email!,
    password: password!,
  );
}
