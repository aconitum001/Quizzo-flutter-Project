import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 60,
      height: 60,
      shape: CircleBorder(),
      color: kPrimaryColor,
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
