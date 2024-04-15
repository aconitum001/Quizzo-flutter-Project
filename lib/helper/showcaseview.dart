import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:showcaseview/showcaseview.dart';

class ShowCaseView extends StatelessWidget {
  const ShowCaseView({
    Key? key,
    required this.child,
    required this.description,
    required this.globalKey,
    required this.title,
  }) : super(key: key);

  final GlobalKey globalKey;
  final String title, description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Showcase(
      descTextStyle: TextStyle(
        fontFamily: kFontText,
        fontSize: 16,
        color: Colors.black87,
      ),
      titleTextStyle: TextStyle(
        fontFamily: kFontText,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.purple,
      ),
      title: title,
      key: globalKey,
      description: description,
      titlePadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      descriptionPadding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
      child: child,
    );
  }
}
