import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    super.key,
    required this.score,
  });
  final int score;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.3,
          height: MediaQuery.of(context).size.height / 4.7,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xffC7A8FC).withOpacity(0.3),
          ),
        ),
        Positioned(
          top: 20,
          bottom: 20,
          right: 20,
          left: 20,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffC7A8FC),
            ),
          ),
        ),
        Positioned(
          top: 40,
          bottom: 40,
          right: 40,
          left: 40,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Score",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: kFontText,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffA76AE4)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$score ",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: kFontText,
                          color: const Color(0xff9D57E3),
                        ),
                      ),
                      Text(
                        "pt",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: kFontText,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffA76AE4),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
