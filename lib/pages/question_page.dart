import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/pages/cubits/question_cubit/question_cubit.dart';
import 'package:quiz_app/services/get_questions.dart';
import 'package:quiz_app/widgets/countDownTimed.dart';
import 'package:quiz_app/widgets/loading_widget.dart';
import 'package:quiz_app/widgets/question_indicator.dart';
import 'package:quiz_app/widgets/response_container.dart';

class QuestionPage extends StatelessWidget {
  QuestionPage({
    super.key,
    required this.catId,
    required this.difficulty,
    required this.questionNumber,
    required this.type,
  });

  final String difficulty, type, catId, questionNumber;
  static String id = "questionPage";
  final CountDownController controller = CountDownController();
  final int length = 5;
  bool isLoading = false;
  List<Question> questions = [];
  int questionSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // List<Question> questions =
    //     BlocProvider.of<QuestionCubit>(context).questions;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Question_background.png"),
        ),
      ),
      child: BlocConsumer<QuestionCubit, QuestionState>(
        listener: (context, state) {
          if (state is QuestionLoading) {
            isLoading = true;
          } else if (state is QuestionSuccess) {
            questions = state.questions;
          }
        },
        builder: (context, state) {
          return isLoading
              ? const LoadingWidget()
              : Scaffold(
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
                            controller.start();
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
                    padding:
                        const EdgeInsets.only(right: 40, left: 40, top: 90),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(23.9),
                              child: Container(
                                width: double.infinity,
                                height: 203.16,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(23.9),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 110,
                              top: -50,
                              child: CountDownTimer(controller: controller),
                            ),
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 20, top: 60),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      QuestionIndicator(
                                        label: "1",
                                        color: Color(0xffA76AE4),
                                      ),
                                      QuestionIndicator(
                                        label: "2",
                                        color: Color(0xffE5E5E5),
                                      ),
                                      QuestionIndicator(
                                        label: "3",
                                        color: Color(0xffE5E5E5),
                                      ),
                                      QuestionIndicator(
                                        label: "4",
                                        color: Color(0xffE5E5E5),
                                      ),
                                      QuestionIndicator(
                                        label: "5",
                                        color: Color(0xffE5E5E5),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 5),
                                  child: Text(
                                    questions[questionSelectedIndex].question,
                                    style: const TextStyle(
                                      fontSize: 19.12,
                                      fontFamily: "Poppins",
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ResponseContainer(
                          response:
                              questions[questionSelectedIndex].correctAnswer,
                          order: "A",
                        ),
                        const ResponseContainer(
                          response: "Tunisia",
                          order: "B",
                        ),
                        const ResponseContainer(
                          response: "France",
                          order: "C",
                        ),
                        const ResponseContainer(
                          response: "Italy",
                          order: "D",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          onPressed: () async {
                            print(questions);
                          },
                          color: kPrimaryColor,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: 50,
                          child: const Center(
                            child: Text(
                              "Next",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Ubuntu",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
