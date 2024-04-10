class Question {
  String type;
  String difficulty;
  String question;
  String correctAnswer;
  List<dynamic> incorrectAnswers;

  Question({
    required this.type,
    required this.difficulty,
    required this.correctAnswer,
    required this.incorrectAnswers,
    required this.question,
  });

  factory Question.fromJson(jsonData) {
    print("hreere");
    return Question(
      type: jsonData["type"],
      difficulty: jsonData["difficulty"],
      correctAnswer: jsonData["correct_answer"],
      incorrectAnswers: jsonData["incorrect_answers"],
      question: jsonData["question"],
    );
  }

  @override
  String toString() {
    return 'Question{type: $type, difficulty: $difficulty, question: $question, correctAnswer: $correctAnswer, incorrectAnswers: $incorrectAnswers}';
  }
}
