import 'package:flutter/material.dart';

class QuestionIndicator extends StatelessWidget {
  const QuestionIndicator({
    super.key,
    required this.label,
    required this.color,
  });
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 5,
        right: 10,
        left: 10,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: color,
            width: 2,
          ),
        ),
      ),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
