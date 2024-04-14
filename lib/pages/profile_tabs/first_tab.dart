// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/widgets/stats_container.dart';

class FirstProfileTab extends StatelessWidget {
  FirstProfileTab({
    super.key,
    required this.data,
  });
  final Map<String, dynamic> data;
  final List<Map<String, dynamic>> historyList = [];
  final List<Map<String, dynamic>> strongestCat = [];
  final List<Map<String, dynamic>> weakestCat = [];
  final LinearGradient gradient = const LinearGradient(
    colors: [
      Color(0xff8251DE),
      Color(0xff462C78),
    ],
  );
  bool exist = false;
  int? index;
  final CategoriesData catdata = CategoriesData();
  String getImageForCategory(String categoryName) {
    categoryName = categoryName.replaceFirst("Science: ", "");
    categoryName = categoryName.replaceFirst("Entertainment: ", "");
    for (var category in catdata.catList) {
      if (category['name'] == categoryName) {
        return category['image'];
      }
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> history = data["history"];
    historyList.add({
      'catName': history[0]["catName"],
      'correctQuestions': history[0]["correctQuestions"],
      'questionNumbers': history[0]["questionNumbers"],
    });
    for (int i = 1; i < history.length; i++) {
      bool exist = false; // Reset exist for each iteration
      for (int j = 0; j < historyList.length; j++) {
        if (history[i]["catName"] == historyList[j]["catName"]) {
          exist = true;
          index = j;
          break; // Exit the loop once a match is found
        }
      }
      if (!exist) {
        historyList.add({
          'catName': history[i]["catName"],
          'correctQuestions': history[i]["correctQuestions"],
          'questionNumbers': history[i]["questionNumbers"],
        });
      } else {
        // Update existing category instead of inserting at a specific index
        historyList[index!]['correctQuestions'] +=
            history[i]["correctQuestions"];
        historyList[index!]['questionNumbers'] += history[i]["questionNumbers"];
      }
    }
    for (int i = 0; i < historyList.length; i++) {
      double percentage = (historyList[i]["correctQuestions"] * 100) /
          historyList[i]["questionNumbers"];
      if (percentage >= 50) {
        strongestCat.add({
          "catName": historyList[i]["catName"],
          "percentage": percentage.round(),
          "image": getImageForCategory(historyList[i]["catName"])
        });
      } else {
        weakestCat.add({
          "catName": historyList[i]["catName"],
          "percentage": percentage.round(),
          "image": getImageForCategory(historyList[i]["catName"])
        });
      }
    }
    final double accuracy =
        (data["correctAnswer"] * 100) / data["totalQuestions"];
    final double progress = (data["totalQuestions"] * 100) / 19206;
    final double averageScpre = data["score"] / data["totalQuestions"];
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
                image: "assets/icons/bar.png",
                subTitle: "Avg.Score",
                title: "${averageScpre.round()}",
                size: 12,
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
                title: "${accuracy.round()}%",
              ),
              StatsContainer(
                color: const Color(0xff4DC3FF).withOpacity(0.15),
                image: "assets/icons/rise 1.png",
                subTitle: "Progress",
                title: progress.toString().length > 5
                    ? "${progress.toString().substring(0, 4)}%"
                    : "$progress%",
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          strongestCat.isEmpty
              ? Container()
              : Text(
                  "STRONGEST THEMES",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: kFontText,
                    color: Colors.white,
                  ),
                ),
          const SizedBox(
            height: 15,
          ),
          strongestCat.isEmpty
              ? Container()
              : Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(23),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: strongestCat.length,
                    itemBuilder: (context, index) => ProgressStatContainer(
                      gradient: gradient,
                      gradientPercentage: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xffFFD894),
                          Color(0xffFFD388),
                          Color(0xffFFB33E),
                          Color(0xffFF9801),
                          Color(0xffFFA113),
                          Color(0xffFFA318),
                          Color(0xffFF9900),
                        ],
                      ),
                      catName: strongestCat[index]["catName"],
                      image: strongestCat[index]["image"],
                      percentage: strongestCat[index]["percentage"],
                    ),
                  ),
                ),
          const SizedBox(
            height: 10,
          ),
          weakestCat.isEmpty
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "WEAKEST THEMES",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: kFontText,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.22,
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: weakestCat.length,
                        itemBuilder: (context, index) => ProgressStatContainer(
                          gradient: gradient,
                          gradientPercentage: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xff77CDFA),
                              Color(0xff2E7599),
                            ],
                          ),
                          catName: weakestCat[index]["catName"],
                          image: weakestCat[index]["image"],
                          percentage: weakestCat[index]["percentage"],
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class ProgressStatContainer extends StatelessWidget {
  const ProgressStatContainer({
    super.key,
    required this.gradient,
    required this.percentage,
    required this.catName,
    required this.gradientPercentage,
    required this.image,
  });

  final LinearGradient gradient, gradientPercentage;
  final String image, catName;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 50,
            height: 40,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (rect) => gradient.createShader(rect),
                      child: Text(
                        catName,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "Oldenburg",
                        ),
                      ),
                    ),
                    Text(
                      "$percentage% Correct",
                      style: TextStyle(
                          color: const Color(0xffBDBDBD),
                          fontSize: 10,
                          fontFamily: kFontText,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                LinearPercentIndicator(
                  animation: true,
                  animationDuration: 1000,
                  barRadius: const Radius.circular(15),
                  lineHeight: 16,
                  percent: percentage / 100,
                  backgroundColor: const Color(0xffDEDEDE),
                  linearGradient: gradientPercentage,
                  padding: const EdgeInsets.all(0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
