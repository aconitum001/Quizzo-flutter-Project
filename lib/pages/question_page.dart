import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
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
    required this.email,
  });

  final String difficulty, type, catId, questionNumber, email;
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
              return const LoadingWidget(
                color: Colors.deepPurple,
              );
            } else if (snapshot.hasData) {
              questions = snapshot.data!;

              return questions.isNotEmpty
                  ? QuestionUi(
                      email: widget.email,
                      controller: controller,
                      questions: questions,
                      questionsNumber: int.parse(widget.questionNumber),
                      type: widget.type,
                      difficulty: widget.difficulty,
                      catId: widget.catId,
                      questionNumber: widget.questionNumber,
                    )
                  : Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            vertical: 200, horizontal: 30),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "There is no data for this type of questions",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: kFontText,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 15,
                                  top: 0,
                                ),
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff8251DE),
                                      Color(0xff462C78),
                                    ],
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Change settings",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Ubuntu",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
            } else {
              return Text(snapshot.error.toString());
            }
          },
        ),
      ),
    );
  }
}
