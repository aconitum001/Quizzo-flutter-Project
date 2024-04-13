import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/data.dart';

class SecoundProfileTab extends StatelessWidget {
  SecoundProfileTab({
    super.key,
    required this.data,
  });
  final Map<String, dynamic> data;
  final LinearGradient gradient = const LinearGradient(
    colors: [
      Color(0xff8251DE),
      Color(0xff462C78),
    ],
  );
  final CategoriesData catdata = CategoriesData();

  String getImageForCategory(String categoryName) {
    for (var category in catdata.catList) {
      if (category['name'] == categoryName) {
        return category['image'];
      }
    }
    // If category name is not found, return a default image or null
    return ''; // You can change this to return a default image path if needed
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ListView.builder(
        itemCount: data["history"].length,
        itemBuilder: (context, index) {
          int score = data["history"][index]["earnedPoints"];
          String catName = data["history"][index]["catName"];
          Timestamp date = data["history"][index]["date"];
          String dateString =
              "${date.toDate().day.toString()}/${date.toDate().month.toString()}/${date.toDate().year.toString()} | ${date.toDate().hour.toString()}:${date.toDate().minute.toString()}";
          String difficulty = data["history"][index]["difficulty"];
          int correctQuestions = data["history"][index]["correctQuestions"];
          int questionNumbers = data["history"][index]["questionNumbers"];
          return HistoryContainer(
            gradient: gradient,
            title: "Earned $score points on the $difficulty quiz",
            subtitle: catName,
            date: dateString,
            correct: "$correctQuestions/$questionNumbers Correct",
            image: getImageForCategory(catName),
          );
        },
      ),
    );
  }
}

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
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 17),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
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
