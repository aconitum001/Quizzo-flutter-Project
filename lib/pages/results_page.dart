import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/widgets/analysesWidger.dart';
import 'package:quiz_app/widgets/score_widget.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    super.key,
    required this.playerResults,
  });
  final List<String> playerResults;
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
        body: Column(
          children: [
            const Center(
              child: ScoreWidget(
                score: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(24),
                color: Colors.transparent,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
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
                          progress: 65,
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
                      const Row(
                        children: [
                          AnaylsesWidget(
                            number: 20,
                            label: "Total Questions",
                            textColor: Color(0xffA42FC1),
                            containerColor: Color(0xffA42FC1),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          AnaylsesWidget(
                            number: 1,
                            label: "Skipped",
                            textColor: Color(0xff6680DB),
                            containerColor: Color(0xff6680DB),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          AnaylsesWidget(
                            number: 13,
                            label: "Correct",
                            textColor: Color(0xff1F8435),
                            containerColor: Color(0xff1F8435),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          AnaylsesWidget(
                            number: 6,
                            label: "Wrong",
                            textColor: Color(0xffFA3939),
                            containerColor: Color(0xffFA3939),
                          ),
                          Spacer(
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
              padding: const EdgeInsets.symmetric(horizontal: 47, vertical: 30),
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
    );
  }
}
