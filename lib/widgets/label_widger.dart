import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class Label extends StatelessWidget {
  const Label({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15.5,
        fontFamily: kFontText,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}
