import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addUserDetails(
    {required String email, required Map<String, dynamic> userInfo}) {
  return FirebaseFirestore.instance
      .collection("users")
      .doc(email)
      .set(userInfo);
}
