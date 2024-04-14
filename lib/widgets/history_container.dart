import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class HistoryContainer extends StatelessWidget {
  const HistoryContainer(
      {super.key,
      required this.gradient,
      required this.title,
      required this.subtitle,
      required this.date,
      required this.correct,
      required this.image});

  final LinearGradient gradient;
  final String title, subtitle, date, correct, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 17),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 19,
            offset: const Offset(2.68, 2.68), // changes position of shadow
          ),
          BoxShadow(
            color: const Color(0xffFAFBFF).withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 17.16,
            offset: const Offset(-1.33, -1.33), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(23),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Image.asset(
              image,
              width: 60,
              height: 60,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Oldenburg",
                    color: Color(0xff000000),
                  ),
                ),
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (rect) => gradient.createShader(rect),
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: "Oldenburg",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        date,
                        style: TextStyle(
                          color: const Color(0xff999999),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          fontFamily: kFontText,
                        ),
                      ),
                      // Adding some space between the texts
                      Text(
                        correct,
                        style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          fontFamily: kFontText,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
