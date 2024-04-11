import 'package:flutter/material.dart';

class CatContainer extends StatelessWidget {
  const CatContainer({
    super.key,
    required this.image,
    required this.title,
    required this.questionsNumber,
  });
  final String image, title, questionsNumber;
  final gradient = const LinearGradient(
    colors: [
      Color(0xff8251DE),
      Color(0xff462C78),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: MediaQuery.of(context).size.height * 0.107,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color(0xff613DA6),
          width: 1,
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
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (rect) => gradient.createShader(rect),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: "Oldenburg",
                  ),
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
