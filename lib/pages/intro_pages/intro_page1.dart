// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/onBoarding_widget.dart';

class IntroPage1 extends StatelessWidget {
  final PageController controller; // Declare controller as a final property

  const IntroPage1({Key? key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return OnBoardingWidget(
      controller: controller,
      description:
          "Challenge yourself with our interactive quizzes and discover how much you know about various topics.",
      image: "assets/images/onBoarding1.png",
    );
  }
}
