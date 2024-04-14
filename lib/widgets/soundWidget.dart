import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SoundWidget extends StatefulWidget {
  const SoundWidget({super.key, required this.player});

  final AudioPlayer player;
  @override
  State<SoundWidget> createState() => _SoundWidgetState();
}

class _SoundWidgetState extends State<SoundWidget> {
  bool sound = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (sound == true) {
          await widget.player.setVolume(0);
          setState(
            () {
              sound = !sound;
            },
          );
        } else {
          await widget.player.setVolume(0.5);
          setState(() {
            sound = !sound;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Image.asset(
          sound == true
              ? "assets/icons/icon music.png"
              : "assets/icons/Vector.png",
        ),
      ),
    );
  }
}
