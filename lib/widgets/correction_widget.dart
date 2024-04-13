import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/widgets/MultipleCorrectionWidget.dart';
import 'package:quiz_app/widgets/booleanCorrectionWidget.dart';
import 'package:quiz_app/widgets/countDownTimed.dart';
import 'package:quiz_app/widgets/question_indicator.dart';

class CorrectionUi extends StatefulWidget {
  const CorrectionUi({
    super.key,
    required this.controller,
    required this.questions,
    required this.questionsNumber,
    required this.type,
    required this.playerResults,
    required this.playerSlectedResponses,
  });

  final CountDownController controller;
  final List<Question> questions;
  final int questionsNumber;
  final List<String> playerResults;
  final List<Map<String, dynamic>> playerSlectedResponses;
  final String type;
  @override
  State<CorrectionUi> createState() => _CorrectionUi();
}

class _CorrectionUi extends State<CorrectionUi> {
  int questionSelectedIndex = 0;

  String? playerResponse;
  void nextQuestion() {
    if (questionSelectedIndex < widget.questionsNumber) {
      setState(() {
        questionSelectedIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // List<dynamic> wrongAnswers =
    //     widget.questions[questionSelectedIndex].incorrectAnswers;
    // String correctAnswer =
    //     widget.questions[questionSelectedIndex].correctAnswer;

    String question = widget.questions[questionSelectedIndex].question
        .replaceAll("&#039;", "'")
        .replaceAll("&quot;", '"')
        .replaceAll("&amp;", "&")
        .replaceAll("&ldquo;", '"')
        .replaceAll("&rdquo;", '"')
        .replaceAll("&lsquo;", "'")
        .replaceAll("&rsquo;", "'");

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Question_background.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                        nextQuestion();
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
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: questionSelectedIndex == 0
                ? null
                : () {
                    setState(
                      () {
                        questionSelectedIndex--;
                      },
                    );
                  },
          ),
          backgroundColor: Colors.transparent,
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
                                duration: 0,
                                controller: widget.controller,
                                questionSelectedIndex: questionSelectedIndex,
                                onComplete: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 22),
                              child: Row(
                                children: [
                                  for (int i = 0;
                                      i <
                                          (widget.questions.length == 10
                                              ? widget.questions.length / 2
                                              : widget.questions.length);
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
                  ? BooleanCorrectionWidget(
                      wrongAnswers: widget
                          .questions[questionSelectedIndex].incorrectAnswers,
                      responseSelectedIndex: -1,
                      onResponseSelected: (response) {
                        playerResponse = response;
                      },
                    )
                  : MultipleCorrectionWidget(
                      wrongAnswers: widget
                          .questions[questionSelectedIndex].incorrectAnswers,
                      responseSelectedIndex:
                          widget.playerSlectedResponses[questionSelectedIndex]
                              ["playerSelectedResponses"],
                      answers:
                          widget.playerSlectedResponses[questionSelectedIndex]
                              ["answers"],
                      onResponseSelected: (response) {
                        playerResponse = response;
                      },
                    ),
              const Spacer(
                flex: 1,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                },
                color: kPrimaryColor,
                textColor: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 45,
                child: const Center(
                  child: Text(
                    "Back to Results",
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
