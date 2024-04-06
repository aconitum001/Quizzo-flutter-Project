import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/services/get_questions.dart';
import 'package:quiz_app/widgets/countDownTimed.dart';
import 'package:quiz_app/widgets/loading_widget.dart';
import 'package:quiz_app/widgets/question_indicator.dart';
import 'package:quiz_app/widgets/response_container.dart';

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
  int questionSelectedIndex = 0;
  int selectedResponse = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
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

            return QuestionUi(
              controller: controller,
              questions: questions,
              questionsNumber: int.parse(widget.questionNumber),
            );
          } else {
            return Text(snapshot.error.toString());
          }
        },
      ),
    );
  }
}

class QuestionUi extends StatefulWidget {
  const QuestionUi({
    super.key,
    required this.controller,
    required this.questions,
    required this.questionsNumber,
  });

  final CountDownController controller;
  final List<Question> questions;
  final int questionsNumber;
  @override
  State<QuestionUi> createState() => _QuestionUiState();
}

class _QuestionUiState extends State<QuestionUi> {
  int questionSelectedIndex = 0;
  int responseSelectedIndex = -1;
  String? playerResponse;
  void nextQuestion(List<dynamic> answers) {
    if (questionSelectedIndex < widget.questionsNumber - 1) {
      answers.shuffle();
      setState(() {
        questionSelectedIndex++;
        widget.controller.start();
        responseSelectedIndex = -1;
        playerResponse = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> wrongAnswers =
        widget.questions[questionSelectedIndex].incorrectAnswers;
    String correctAnswer =
        widget.questions[questionSelectedIndex].correctAnswer;
    List<dynamic> answers = [...wrongAnswers, correctAnswer];
    print(widget.questions);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white, // Set underline color here
                  width: 1.0, // Set underline thickness here
                ),
              ),
            ),
            child: InkWell(
              onTap: () {
                nextQuestion(answers);
              },
              child: const Text(
                "Next",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontFamily: "Oldenburg",
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 40, left: 40, top: 65),
        child: Column(
          children: [
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(23.9),
              child: Container(
                width: double.infinity,
                height: widget.questionsNumber == 10 ? 250.16 : 215,
                padding: const EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(23.9),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -55,
                      right: 1,
                      left: 1,
                      child: Column(
                        children: [
                          Center(
                            child: CountDownTimer(
                              controller: widget.controller,
                              nextQuestion: nextQuestion,
                              answers: answers,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Row(
                              children: [
                                for (int i = 0;
                                    i <
                                        (widget.questionsNumber == 10
                                            ? widget.questionsNumber / 2
                                            : widget.questionsNumber);
                                    i++)
                                  QuestionIndicator(
                                    label: "${i + 1}",
                                    color: questionSelectedIndex == i
                                        ? const Color(0xffA76AE4)
                                        : const Color(0xffE5E5E5),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          if (widget.questionsNumber == 10)
                            Padding(
                              padding: const EdgeInsets.only(left: 22),
                              child: Row(
                                children: [
                                  for (int i = 5;
                                      i < widget.questionsNumber;
                                      i++)
                                    QuestionIndicator(
                                      label: "${i + 1}",
                                      color: questionSelectedIndex == i
                                          ? const Color(0xffA76AE4)
                                          : const Color(0xffE5E5E5),
                                    ),
                                ],
                              ),
                            ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.questions[questionSelectedIndex].question,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (responseSelectedIndex == 0) {
                    // Deselect the currently selected response
                    responseSelectedIndex = -1;
                    playerResponse = null;
                  } else {
                    // Select the tapped response
                    responseSelectedIndex = 0;
                    playerResponse = answers[0];
                  }
                });
              },
              child: ResponseContainer(
                response: answers[0],
                order: "A",
                color: responseSelectedIndex == 0
                    ? const Color(0xff6808C7)
                    : Colors.transparent,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (responseSelectedIndex == 1) {
                    // Deselect the currently selected response
                    responseSelectedIndex = -1;
                    playerResponse = null;
                  } else {
                    // Select the tapped response
                    responseSelectedIndex = 1;
                    playerResponse = answers[1];
                  }
                });
              },
              child: ResponseContainer(
                response: answers[1],
                order: "B",
                color: responseSelectedIndex == 1
                    ? const Color(0xff6808C7)
                    : Colors.transparent,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (responseSelectedIndex == 2) {
                    // Deselect the currently selected response
                    responseSelectedIndex = -1;
                    playerResponse = null;
                  } else {
                    // Select the tapped response
                    responseSelectedIndex = 2;
                    playerResponse = answers[2];
                  }
                });
              },
              child: ResponseContainer(
                response: answers[2],
                order: "C",
                color: responseSelectedIndex == 2
                    ? const Color(0xff6808C7)
                    : Colors.transparent,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (responseSelectedIndex == 3) {
                    // Deselect the currently selected response
                    responseSelectedIndex = -1;
                    playerResponse = null;
                  } else {
                    // Select the tapped response
                    responseSelectedIndex = 3;
                    playerResponse = answers[3];
                  }
                });
              },
              child: ResponseContainer(
                response: answers[3],
                order: "D",
                color: responseSelectedIndex == 3
                    ? const Color(0xff6808C7)
                    : Colors.transparent,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () async {},
              color: kPrimaryColor,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              height: 50,
              child: const Center(
                child: Text(
                  "Submit Quiz",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Ubuntu",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                "Exit",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w500,
                  color: Color(0xffA76AE4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
