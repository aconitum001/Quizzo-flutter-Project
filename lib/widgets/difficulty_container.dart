import 'package:flutter/material.dart';

class DifficultyContainer extends StatelessWidget {
  const DifficultyContainer({
    super.key,
    required this.title,
    required this.onTap,
    required this.color,
  });
  final Color color;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        child: Container(
          width: 110,
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "Oldenburg",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
