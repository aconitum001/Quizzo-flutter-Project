import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class FirstProfileTab extends StatelessWidget {
  const FirstProfileTab({
    super.key,
    required this.data,
  });
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final double accuracy =
        (data["correctAnswer"] * 100) / data["totalQuestions"];
    final double progress = (data["totalQuestions"] * 100) / 19206;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatsContainer(
                color: const Color(0xffFEA704).withOpacity(0.2),
                image: "assets/icons/search 1.png",
                subTitle: "Quizzes",
                title: "${data["quizTaken"]}",
              ),
              StatsContainer(
                color: const Color(0xffD1AEE5).withOpacity(0.35),
                image: "assets/icons/winner 1.png",
                subTitle: "LeaderBoard",
                title: "#7",
              ),
            ],
          ),
          const SizedBox(
            height: 11,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatsContainer(
                color: const Color(0xff02BC7D).withOpacity(0.15),
                image: "assets/icons/checkmark.png",
                subTitle: "Accuracy",
                title: accuracy.toString().length > 5
                    ? "${accuracy.toString().substring(0, 5)}%"
                    : "$accuracy%",
              ),
              StatsContainer(
                color: const Color(0xff4DC3FF).withOpacity(0.15),
                image: "assets/icons/rise 1.png",
                subTitle: "Progress",
                title: progress.toString().length > 5
                    ? "${progress.toString().substring(0, 5)}%"
                    : "$progress%",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StatsContainer extends StatelessWidget {
  const StatsContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.color,
    required this.image,
  });
  final String image;
  final String title, subTitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.085,
      width: MediaQuery.of(context).size.width * 0.43,
      decoration: BoxDecoration(
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
              child: Image.asset(image),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
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
                    fontSize: 13,
                    fontFamily: kFontText,
                    color: const Color(0xff999999),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
