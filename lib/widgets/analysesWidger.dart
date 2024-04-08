import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class AnaylsesWidget extends StatelessWidget {
  const AnaylsesWidget(
      {super.key,
      required this.number,
      required this.label,
      required this.textColor,
      required this.containerColor});
  final int number;
  final String label;
  final Color textColor, containerColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: containerColor,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$number",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: kFontText,
                color: textColor,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontFamily: kFontText,
                fontSize: 16,
                color: const Color(0xff2B262D),
              ),
            )
          ],
        ),
      ],
    );
  }
}
