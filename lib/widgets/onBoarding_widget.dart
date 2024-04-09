// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/pages/login_page.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget(
      {super.key,
      required this.controller,
      required this.image,
      required this.description});
  final String image;
  final String description;

  final PageController controller;

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
            Image.asset(image),
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
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: kFontText,
                    ),
                  ),
                  const Spacer(flex: 1),
                  MaterialButton(
                    elevation: 6,
                    onPressed: () {
                      controller.nextPage(
                        duration: const Duration(
                            milliseconds: 500), // milliseconds not microseconds
                        curve: Curves.easeInOut, // smoother animation curve
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: kPrimaryColor,
                    minWidth: MediaQuery.of(context).size.width * 0.78,
                    height: 50,
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: kFontText,
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have An Account ? ",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: kFontText,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, LogInPage.id);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 15,
                            fontFamily: kFontText,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
