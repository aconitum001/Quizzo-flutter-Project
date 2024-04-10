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

Future<void> updateUserDetails({required String id, required int score}) {
  return FirebaseFirestore.instance
      .collection("users")
      .doc(id)
      .get()
      .then((value) {
    Map<String, dynamic> data = value.data() as Map<String, dynamic>;
    int newScore = data["score"] + score;
    return FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .update({'score': newScore});
  }).catchError((error) {
    throw error; // Rethrow the error for the caller to handle
  });
}
