import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/widgets/category_container.dart';

class FirstTab extends StatefulWidget {
  FirstTab({
    super.key,
    required this.updateIndex,
  });
  final void Function(int, int?) updateIndex;

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  final CategoriesData data = CategoriesData();
  int selectedIndex = -1;
  final AudioPlayer player = AudioPlayer();
  Future<void> playSound() async {
    String soundPath =
        "sounds/456601__bumpelsnake__select10.wav"; //You don't need to include assets/ because AssetSource assume that you have sound in your assets folder.
    await player.play(AssetSource(soundPath));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: data.otherList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            playSound();
            setState(
              () {
                if (selectedIndex == index) {
                  selectedIndex = -1;
                  widget.updateIndex(-1, null);
                } else {
                  selectedIndex = index;
                  widget.updateIndex(index, data.otherList[index]["id"]);
                }
              },
            );
          },
          child: CatContainer(
            image: data.otherList[index]["image"],
            title: data.otherList[index]["name"],
            color: selectedIndex == index ? Colors.purple : Colors.grey,
            questionsNumber:
                data.otherList[index]["total_questions"].toString(),
          ),
        ),
      ),
    );
  }
}
