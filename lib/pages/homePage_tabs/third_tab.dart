import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/widgets/category_container.dart';

class ThirdTab extends StatefulWidget {
  ThirdTab({
    super.key,
    required this.updateIndex,
  });

  final void Function(int, int?) updateIndex;

  @override
  State<ThirdTab> createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
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
        itemCount: data.scienceList.length,
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
                  widget.updateIndex(index, data.scienceList[index]["id"]);
                }
              },
            );
          },
          child: CatContainer(
            image: data.scienceList[index]["image"],
            color: selectedIndex == index ? Colors.purple : Colors.grey,
            title: data.scienceList[index]["name"],
            questionsNumber:
                data.scienceList[index]["total_questions"].toString(),
          ),
        ),
      ),
    );
  }
}
