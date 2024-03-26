// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/onBoarding_widget.dart';

class IntroPage2 extends StatelessWidget {
  IntroPage2({
    super.key,
    required this.controller,
  });
  PageController controller;

  @override
  Widget build(BuildContext context) {
    return OnBoardingWidget(
        controller: controller,
        image: "assets/images/onBoarding2.png",
        description:
            "Participate in educational quizzes designed to infuse enjoyment and enthusiasm into the learning process.");
  }
}
