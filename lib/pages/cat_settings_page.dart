import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:quiz_app/constants.dart';

import 'package:quiz_app/pages/question_page.dart';
import 'package:quiz_app/widgets/difficulty_container.dart';
import 'package:quiz_app/widgets/number_container.dart';
import 'package:quiz_app/widgets/typeContainer.dart';

class CatSettingsPage extends StatefulWidget {
  CatSettingsPage({
    super.key,
    required this.catId,
  });
  static String id = "catSettingsPage";
  final int catId;

  @override
  State<CatSettingsPage> createState() => _CatSettingsPageState();
}

class _CatSettingsPageState extends State<CatSettingsPage> {
  String? difficulty;
  String? type;
  int? questionNumbers;

  int difficultySelectedindex = -1;
  int typeSelectedIndex = -1;
  int questionIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kPrimaryColor,
            const Color(0xff5C3B7E),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            children: [
              AppBar(
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
                        if (difficulty != null &&
                            questionNumbers != null &&
                            type != null) {
                          pushScreen(
                            context,
                            screen: QuestionPage(
                              type: type!,
                              catId: widget.catId.toString(),
                              questionNumber: questionNumbers.toString(),
                              difficulty: difficulty!,
                            ),
                            withNavBar: false,
                          );
                        }
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
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      const Text(
                        "Quiz zone",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Oldenburg",
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DifficultyContainer(
                            title: "Hard",
                            color: difficultySelectedindex == 0
                                ? const Color(0xff71DFC6)
                                : const Color(0xffE3D8F7),
                            onTap: () {
                              setState(() {
                                if (difficultySelectedindex == 0) {
                                  difficultySelectedindex = -1;
                                  difficulty = null;
                                } else {
                                  difficultySelectedindex = 0;
                                  difficulty = "hard";
                                }
                              });
                            },
                          ),
                          DifficultyContainer(
                            title: "Medium",
                            color: difficultySelectedindex == 1
                                ? const Color(0xff71DFC6)
                                : const Color(0xffE3D8F7),
                            onTap: () {
                              setState(() {
                                if (difficultySelectedindex == 1) {
                                  difficultySelectedindex = -1;
                                  difficulty = null;
                                } else {
                                  difficultySelectedindex = 1;
                                  difficulty = "medium";
                                }
                              });
                            },
                          ),
                          DifficultyContainer(
                            title: "Easy",
                            color: difficultySelectedindex == 2
                                ? const Color(0xff71DFC6)
                                : const Color(0xffE3D8F7),
                            onTap: () {
                              setState(() {
                                if (difficultySelectedindex == 2) {
                                  difficultySelectedindex = -1;
                                  difficulty = null;
                                } else {
                                  difficultySelectedindex = 2;
                                  difficulty = "easy";
                                }
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      const Text(
                        "Play Zone",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Oldenburg",
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      const Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.quiz_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Choose the Type of questions :",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Ubuntu",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TypeContainer(
                        title: "True/false",
                        color: typeSelectedIndex == 0
                            ? const Color(0xff71DFC6)
                            : const Color(0xffE3D8F7),
                        onTap: () {
                          setState(() {
                            if (typeSelectedIndex == 0) {
                              typeSelectedIndex = -1;
                              type = null;
                            } else {
                              typeSelectedIndex = 0;
                              type = "boolean";
                            }
                          });
                        },
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      TypeContainer(
                        title: "Multiple Choise",
                        color: typeSelectedIndex == 1
                            ? const Color(0xff71DFC6)
                            : const Color(0xffE3D8F7),
                        onTap: () {
                          setState(
                            () {
                              if (typeSelectedIndex == 1) {
                                typeSelectedIndex = -1;
                                type = null;
                              } else {
                                typeSelectedIndex = 1;
                                type = "multiple";
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.quiz_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Choose the Number of questions :",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Ubuntu",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NumberContainer(
                            title: "5 Questions",
                            onTap: () {
                              setState(() {
                                if (questionIndex == 0) {
                                  questionIndex = -1;
                                  questionNumbers = null;
                                } else {
                                  questionIndex = 0;
                                  questionNumbers = 5;
                                }
                              });
                            },
                            color: questionIndex == 0
                                ? const Color(0xff71DFC6)
                                : const Color(0xffE3D8F7),
                          ),
                          NumberContainer(
                            title: "10 Questions",
                            onTap: () {
                              setState(() {
                                if (questionIndex == 1) {
                                  questionIndex = -1;
                                  questionNumbers = null;
                                } else {
                                  questionIndex = 1;
                                  questionNumbers = 10;
                                }
                              });
                            },
                            color: questionIndex == 1
                                ? const Color(0xff71DFC6)
                                : const Color(0xffE3D8F7),
                          ),
                          NumberContainer(
                            title: "15 Questions",
                            onTap: () {
                              setState(() {
                                if (questionIndex == 2) {
                                  questionIndex = -1;
                                  questionNumbers = null;
                                } else {
                                  questionIndex = 2;
                                  questionNumbers = 15;
                                }
                              });
                            },
                            color: questionIndex == 2
                                ? const Color(0xff71DFC6)
                                : const Color(0xffE3D8F7),
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                    ],
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
