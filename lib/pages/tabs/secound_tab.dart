import 'package:flutter/material.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/widgets/category_container.dart';

class SecoundTab extends StatelessWidget {
  SecoundTab({super.key});

  final CategoriesData data = CategoriesData();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => CatContainer(
          image: data.entertainmentList[index]["image"],
          title: data.entertainmentList[index]["name"],
          questionsNumber:
              data.entertainmentList[index]["total_questions"].toString(),
        ),
      ),
    );
  }
}
