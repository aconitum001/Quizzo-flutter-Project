import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/widgets/difficulty_container.dart';
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
                      onTap: () {},
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
                                difficultySelectedindex = 0;
                                difficulty = "Hard";
                              });
                            },
                          ),
                          DifficultyContainer(
                            title: "Medium",
                            color: difficultySelectedindex == 1
                                ? const Color(0xff71DFC6)
                                : const Color(0xffE3D8F7),
                            onTap: () {
                              difficultySelectedindex = 1;
                              difficulty = "medium";
                              setState(() {});
                            },
                          ),
                          DifficultyContainer(
                            title: "Easy",
                            color: difficultySelectedindex == 2
                                ? const Color(0xff71DFC6)
                                : const Color(0xffE3D8F7),
                            onTap: () {
                              difficultySelectedindex = 2;
                              difficulty = "easy";
                              setState(() {});
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
                            typeSelectedIndex = 0;
                            type = "boolean";
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
                              typeSelectedIndex = 1;
                              type = "multiple";
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
                                questionIndex = 0;
                                questionNumbers = 5;
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
                                questionIndex = 1;
                                questionNumbers = 10;
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
                                questionIndex = 2;
                                questionNumbers = 15;
                              });
                            },
                            color: questionIndex == 2
                                ? const Color(0xff71DFC6)
                                : const Color(0xffE3D8F7),
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 1,
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

class NumberContainer extends StatelessWidget {
  const NumberContainer({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
  });
  final String title;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 5,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 110,
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: "Oldenburg",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
