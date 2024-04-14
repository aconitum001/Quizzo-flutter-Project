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
          top: 18,
          bottom: 18,
          right: 18,
          left: 18,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffC7A8FC),
            ),
          ),
        ),
        Positioned(
          top: 38,
          bottom: 38,
          right: 38,
          left: 38,
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
                        fontSize: 18,
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
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontFamily: kFontText,
                          color: const Color(0xff9D57E3),
                        ),
                      ),
                      Text(
                        "pt",
                        style: TextStyle(
                          fontSize: 18,
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
