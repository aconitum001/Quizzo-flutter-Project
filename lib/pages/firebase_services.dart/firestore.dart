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

Future<void> updateUserDetails({
  required String id,
  required int score,
  required int questionNumbers,
  required int correctAnswers,
  required String catName,
  required int questionlength,
  required String difficulty,
  required DateTime date,
}) {
  return FirebaseFirestore.instance
      .collection("users")
      .doc(id)
      .get()
      .then((value) {
    Map<String, dynamic> data = value.data() as Map<String, dynamic>;
    int newScore = data["score"] + score;
    int newQuestionNumbers = data["totalQuestions"] + questionNumbers;
    int quizTaken = data["quizTaken"] + 1;
    int correctAnswer = data["correctAnswer"] + correctAnswers;
    List history = data["history"];
    history.add({
      'catName': catName,
      'correctQuestions': correctAnswers,
      'difficulty': difficulty,
      'earnedPoints': score,
      'questionNumbers': questionlength,
      'date': date,
    });

    return FirebaseFirestore.instance.collection("users").doc(id).update({
      'score': newScore,
      'correctAnswer': correctAnswer,
      'quizTaken': quizTaken,
      'totalQuestions': newQuestionNumbers,
      'history': history,
    });
  }).catchError((error) {
    throw error; // Rethrow the error for the caller to handle
  });
}
