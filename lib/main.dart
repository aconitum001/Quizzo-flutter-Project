import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/intro_pages/get_started.dart';
import 'package:quiz_app/pages/onBoarding_page.dart';

void main() {
  runApp(const Quiz());
}

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      routes: {
        HomePage.id: (context) => const HomePage(),
        OnBoardingPage.id: (context) => OnBoardingPage(),
        GetStartedPage.id: (context) => const GetStartedPage()
      },
      initialRoute: OnBoardingPage.id,
    );
  }
}
