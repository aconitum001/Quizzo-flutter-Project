import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addUserDetails(
    {required String email, required Map<String, dynamic> userInfo}) {
  return FirebaseFirestore.instance
      .collection("users")
      .doc(email)
      .set(userInfo);
}

Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails(
    {required String id}) {
  return FirebaseFirestore.instance.collection("users").doc(id).get();
}
