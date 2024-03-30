import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class CatContainer extends StatelessWidget {
  const CatContainer({
    super.key,
    required this.image,
    required this.title,
    required this.questionsNumber,
  });
  final String image, title, questionsNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 96,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color(0xff643EAB),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              image,
              width: 74,
              height: 61,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                  fontFamily: "Oldenburg",
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.article_outlined,
                    color: Color(0xff999999),
                  ),
                  Text(
                    " $questionsNumber questions",
                    style: const TextStyle(
                      color: Color(0xff999999),
                      fontSize: 15,
                      fontFamily: "Oldenburg",
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
