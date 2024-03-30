import 'package:flutter/material.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/widgets/category_container.dart';

class FirstTab extends StatelessWidget {
  FirstTab({super.key});
  final CategoriesData data = CategoriesData();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: data.otherList.length,
        itemBuilder: (context, index) => CatContainer(
          image: data.otherList[index]["image"],
          title: data.otherList[index]["name"],
          questionsNumber: data.otherList[index]["total_questions"].toString(),
        ),
      ),
    );
  }
}
