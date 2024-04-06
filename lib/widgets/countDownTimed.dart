import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class CountDownTimer extends StatelessWidget {
  const CountDownTimer({
    super.key,
    required this.controller,
  });

  final CountDownController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: CircularCountDownTimer(
        width: 80,
        height: 80,
        duration: 60,
        controller: controller,
        textStyle: const TextStyle(
          color: Color(0xffA76AE4),
          fontSize: 26,
          fontFamily: "Ubuntu",
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        fillColor: Colors.white,
        ringColor: const Color(0xffA76AE4),
        isReverse: true,
      ),
    );
  }
}
