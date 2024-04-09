import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/services/get_questions.dart';
import 'package:quiz_app/widgets/loading_widget.dart';
import 'package:quiz_app/widgets/questions_display_widget.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({
    super.key,
    required this.catId,
    required this.difficulty,
    required this.questionNumber,
    required this.type,
  });

  final String difficulty, type, catId, questionNumber;
  static String id = "questionPage";

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final CountDownController controller = CountDownController();

  List<Question> questions = [];

  int selectedResponse = -1;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Question_background.png"),
          ),
        ),
        child: FutureBuilder(
          future: GetQuestionsService().getQuestions(
              type: widget.type,
              difficulty: widget.difficulty,
              questionNumbers: widget.questionNumber,
              catId: widget.catId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingWidget();
            } else if (snapshot.hasData) {
              questions = snapshot.data!;

              return questions.isNotEmpty
                  ? QuestionUi(
                      controller: controller,
                      questions: questions,
                      questionsNumber: int.parse(widget.questionNumber),
                      type: widget.type,
                    )
                  : Text("there is no data");
            } else {
              return Text(snapshot.error.toString());
            }
          },
        ),
      ),
    );
  }
}
