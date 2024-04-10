import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.image,
      required this.questionsNumber,
      required this.title,
      required this.color});

  final String image, title, questionsNumber;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: color,
      elevation: 5,
      child: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Image.asset(
              image,
              width: 53,
              height: 58,
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              title,
              style: const TextStyle(
                fontFamily: "OldenBurg",
                fontSize: 14,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              " $questionsNumber Questions",
              style: const TextStyle(
                fontFamily: "Nunito",
                fontSize: 9,
                color: Colors.white,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
