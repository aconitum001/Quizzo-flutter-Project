import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class StatsContainer extends StatelessWidget {
  const StatsContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.color,
    required this.image,
    this.size = 13,
    // required this.width,
    // required this.height,
  });
  final String image;
  final String title, subTitle;
  final Color color;
  final double size;
  // final double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      height: MediaQuery.of(context).size.height * 0.085,
      width: MediaQuery.of(context).size.width * 0.43,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xffA6ABBD).withOpacity(0.8),
            spreadRadius: 0,
            blurRadius: 18.5,
            offset: const Offset(2.5, 2.5), // changes position of shadow
          ),
          BoxShadow(
            color: const Color(0xffFAFBFF).withOpacity(0.4),
            offset: const Offset(-1.24, -1.24),
            blurRadius: 16,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Row(
          children: [
            Container(
              width: 31,
              height: 31,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: Image.asset(
                image,
                width: 31,
                height: 31,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: kFontText,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      fontSize: size,
                      fontFamily: kFontText,
                      color: const Color(0xff999999),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
