// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/pages/intro_pages/get_started.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/onboarding_background.png"),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Image.asset("assets/images/onBoarding3.png"),
            const Spacer(
              flex: 1,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Text(
                    "Prove your expertise and become a quiz master by answering thought-provoking questions subjects. ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: kFontText,
                    ),
                  ),
                  const Spacer(flex: 2),
                  MaterialButton(
                    elevation: 6,
                    onPressed: () {
                      Navigator.pushNamed(context, GetStartedPage.id);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: kPrimaryColor,
                    minWidth: MediaQuery.of(context).size.width * 0.78,
                    height: 50,
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: kFontText,
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
