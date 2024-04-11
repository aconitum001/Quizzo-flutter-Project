import 'package:flutter/material.dart';

class NumberContainer extends StatelessWidget {
  const NumberContainer({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
  });
  final String title;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 5,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.41,
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
                fontSize: 15,
                fontFamily: "Oldenburg",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
