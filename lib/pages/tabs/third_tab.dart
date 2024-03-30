import 'package:flutter/material.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/widgets/category_container.dart';

class ThirdTab extends StatelessWidget {
  ThirdTab({super.key});

  final CategoriesData data = CategoriesData();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: data.scienceList.length,
        itemBuilder: (context, index) => CatContainer(
          image: data.scienceList[index]["image"],
          title: data.scienceList[index]["name"],
          questionsNumber:
              data.scienceList[index]["total_questions"].toString(),
        ),
      ),
    );
  }
}
