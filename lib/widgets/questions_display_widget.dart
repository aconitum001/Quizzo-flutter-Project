import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/results_page.dart';
import 'package:quiz_app/widgets/boolean_response_widget.dart';
import 'package:quiz_app/widgets/countDownTimed.dart';
import 'package:quiz_app/widgets/multiple_response_widget.dart';
import 'package:quiz_app/widgets/question_indicator.dart';

class QuestionUi extends StatefulWidget {
  const QuestionUi({
    super.key,
    required this.controller,
    required this.questions,
    required this.questionsNumber,
    required this.type,
    required this.email,
  });

  final CountDownController controller;
  final List<Question> questions;
  final int questionsNumber;
  final String type, email;
  @override
  State<QuestionUi> createState() => _QuestionUiState();
}

class _QuestionUiState extends State<QuestionUi> {
  List<String> playerResponses = [];
  int questionSelectedIndex = 0;
  int responseSelectedIndex = -1;
  String? playerResponse;
  void nextQuestion(List<dynamic> answers, String? response) {
    if (questionSelectedIndex < widget.questionsNumber) {
      setState(() {
        checkPlayerResponse(response);
        questionSelectedIndex++;
        widget.controller.start();
        responseSelectedIndex = -1;
        playerResponse = null;
      });
    }
  }

  void checkPlayerResponse(String? response) {
    if (response == widget.questions[questionSelectedIndex].correctAnswer) {
      playerResponses.insert(questionSelectedIndex, "true");
    } else if (response == null) {
      playerResponses.insert(questionSelectedIndex, "null");
    } else {
      playerResponses.insert(questionSelectedIndex, "false");
    }
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> wrongAnswers =
        widget.questions[questionSelectedIndex].incorrectAnswers;
    String correctAnswer =
        widget.questions[questionSelectedIndex].correctAnswer;

    List<dynamic> answers = [...wrongAnswers, correctAnswer];

    String question = widget.questions[questionSelectedIndex].question
        .replaceAll("&#039;", "'")
        .replaceAll("&quot;", '"')
        .replaceAll("&amp;", "&")
        .replaceAll("&ldquo;", '"')
        .replaceAll("&rdquo;", '"')
        .replaceAll("&lsquo;", "'")
        .replaceAll("&rsquo;", "'");
    if (questionSelectedIndex != widget.questionsNumber - 1) {
      answers.shuffle();
    }

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
              onTap: questionSelectedIndex == widget.questionsNumber - 1
                  ? null
                  : () {
                      nextQuestion(answers, playerResponse);
                    },
              child: Text(
                questionSelectedIndex == widget.questionsNumber - 1
                    ? "Done"
                    : "Next",
                style: const TextStyle(
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
          onPressed: () => Navigator.popAndPushNamed(
            context,
            HomePage.id,
            arguments: widget.email,
          ),
          icon: const Icon(
            Icons.logout,
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
                              questionSelectedIndex: questionSelectedIndex,
                              onComplete: () {
                                if (questionSelectedIndex ==
                                    widget.questionsNumber - 1) {
                                  checkPlayerResponse(playerResponse);

                                  pushScreen(context,
                                      screen: ResultPage(
                                        email: widget.email,
                                        playerResults: playerResponses,
                                        questions: widget.questions,
                                        type: widget.type,
                                      ),
                                      withNavBar: false);
                                } else {
                                  nextQuestion(answers, playerResponse);
                                }
                              },
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
                            question,
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
            const Spacer(
              flex: 1,
            ),
            widget.type == "boolean"
                ? BooleanResponseWidget(
                    responseSelectedIndex: responseSelectedIndex,
                    onResponseSelected: (response) {
                      playerResponse = response;
                    },
                  )
                : MultipleResponseWidget(
                    responseSelectedIndex: responseSelectedIndex,
                    answers: answers,
                    onResponseSelected: (response) {
                      playerResponse = response;
                    },
                  ),
            const Spacer(
              flex: 1,
            ),
            MaterialButton(
              onPressed: widget.questionsNumber - 1 == questionSelectedIndex
                  ? () {
                      checkPlayerResponse(playerResponse);
                      pushScreen(context,
                          screen: ResultPage(
                            email: widget.email,
                            playerResults: playerResponses,
                            questions: widget.questions,
                            type: widget.type,
                          ),
                          withNavBar: false);
                    }
                  : null,
              disabledColor: const Color(0xffE5E5E5),
              color: kPrimaryColor,
              textColor: widget.questionsNumber - 1 == questionSelectedIndex
                  ? Colors.white
                  : Colors.black26,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              height: 45,
              child: const Center(
                child: Text(
                  "Submit Quiz",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
