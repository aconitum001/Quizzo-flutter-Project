// ignore_for_file: must_be_immutable

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/widgets/analysesWidger.dart';
import 'package:quiz_app/widgets/correction_widget.dart';
import 'package:quiz_app/widgets/score_widget.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    super.key,
    required this.playerResults,
    required this.questions,
    required this.type,
    required this.email,
  });
  final List<String> playerResults;
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  final List<Question> questions;
  final String type, email;
  int score = 0, totalQuestions = 0, correct = 0, skipped = 0, wrong = 0;

  @override
  Widget build(BuildContext context) {
    totalQuestions = playerResults.length;
    for (String response in playerResults) {
      if (response == "true") {
        score += 10;
        correct++;
      } else if (response == "false") {
        wrong++;
      } else {
        skipped++;
      }
    }
    return PopScope(
      canPop: false,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/score.png"),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: IconButton(
                icon: const Icon(
                  Icons.rule,
                  color: Colors.white,
                ),
                onPressed: () {
                  pushScreen(
                    context,
                    screen: CorrectionUi(
                      playerResults: playerResults,
                      controller: CountDownController(),
                      questions: questions,
                      questionsNumber: questions.length,
                      type: type,
                    ),
                  );
                },
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, HomePage.id,
                      arguments: email);
                },
              ),
              const SizedBox(
                width: 5,
              )
            ],
          ),
          body: Column(
            children: [
              Center(
                child: ScoreWidget(
                  score: score,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 25),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Test resulat",
                          style: TextStyle(
                            color: const Color(0xff999999).withOpacity(0.6),
                            fontSize: 20,
                            fontFamily: kFontText,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: DashedCircularProgressBar.aspectRatio(
                            aspectRatio: 3.3, // width ÷ height
                            valueNotifier: _valueNotifier,
                            progress: (correct * 100) / totalQuestions,
                            maxProgress: 100,
                            corners: StrokeCap.butt,
                            foregroundColor: const Color(0xffA76AE4),
                            backgroundColor: const Color(0xffeeeeee),
                            foregroundStrokeWidth: 13,
                            backgroundStrokeWidth: 13,
                            animation: true,
                            child: Center(
                              child: ValueListenableBuilder(
                                valueListenable: _valueNotifier,
                                builder: (_, double value, __) => Text(
                                  '${value.toInt()}%',
                                  style: TextStyle(
                                    color: const Color(0xff9D57E3),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                    fontFamily: kFontText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Quiz analyses ",
                          style: TextStyle(
                            color: const Color(0xff999999).withOpacity(0.6),
                            fontSize: 20,
                            fontFamily: kFontText,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            AnaylsesWidget(
                              number: totalQuestions,
                              label: "Total Questions",
                              textColor: const Color(0xffA42FC1),
                              containerColor: const Color(0xffA42FC1),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            AnaylsesWidget(
                              number: skipped,
                              label: "Skipped",
                              textColor: const Color(0xff6680DB),
                              containerColor: const Color(0xff6680DB),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            AnaylsesWidget(
                              number: correct,
                              label: "Correct",
                              textColor: const Color(0xff1F8435),
                              containerColor: const Color(0xff1F8435),
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                            AnaylsesWidget(
                              number: wrong,
                              label: "Wrong",
                              textColor: const Color(0xffFA3939),
                              containerColor: const Color(0xffFA3939),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 47, vertical: 30),
                child: MaterialButton(
                  elevation: 5,
                  onPressed: () {},
                  height: 50,
                  minWidth: double.infinity,
                  color: kPrimaryColor,
                  child: const Text(
                    "Play again",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Ubuntu",
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
