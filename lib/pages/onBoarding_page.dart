// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/pages/intro_pages/intro_page1.dart';
import 'package:quiz_app/pages/intro_pages/intro_page2.dart';
import 'package:quiz_app/pages/intro_pages/intro_page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  static String id = "/onBoarding";

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              IntroPage1(controller: controller),
              IntroPage2(controller: controller),
              const IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.43),
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                dotColor: Colors.white,
                activeDotColor: kTextAccent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
