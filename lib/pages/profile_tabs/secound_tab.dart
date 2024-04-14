import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/widgets/history_container.dart';

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
    categoryName = categoryName.replaceFirst("Science: ", "");
    categoryName = categoryName.replaceAll("Entertainment: ", "");
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
      padding: const EdgeInsets.only(top: 30, bottom: 15),
      child: ListView.builder(
        clipBehavior: Clip.none,
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
