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
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xffC7A8FC),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(
          sound == true ? Icons.volume_up_rounded : Icons.volume_off_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
