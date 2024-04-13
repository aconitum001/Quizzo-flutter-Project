class Question {
  String type;
  String difficulty;
  String question;
  String correctAnswer;
  String name;
  List<dynamic> incorrectAnswers;

  Question({
    required this.type,
    required this.difficulty,
    required this.correctAnswer,
    required this.incorrectAnswers,
    required this.question,
    required this.name,
  });

  factory Question.fromJson(jsonData) {
    return Question(
      type: jsonData["type"],
      difficulty: jsonData["difficulty"],
      correctAnswer: jsonData["correct_answer"],
      incorrectAnswers: jsonData["incorrect_answers"],
      question: jsonData["question"],
      name: jsonData["category"],
    );
  }

  @override
  String toString() {
    return 'Question{type: $type, difficulty: $difficulty, question: $question, correctAnswer: $correctAnswer, incorrectAnswers: $incorrectAnswers}';
  }
}
