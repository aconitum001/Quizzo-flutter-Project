// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class BooleanCorrectionWidget extends StatefulWidget {
  BooleanCorrectionWidget({
    super.key,
    required this.responseSelectedIndex,
    required this.onResponseSelected,
    required this.wrongAnswers,
  });
  int responseSelectedIndex;
  final List<dynamic> wrongAnswers;
  final Function(String?) onResponseSelected;

  @override
  State<BooleanCorrectionWidget> createState() => _BooleanResponseWidgetState();
}

class _BooleanResponseWidgetState extends State<BooleanCorrectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(
              () {
                if (widget.responseSelectedIndex == 0) {
                  widget.responseSelectedIndex = -1;
                  widget.onResponseSelected(null);
                } else {
                  widget.responseSelectedIndex = 0;
                  widget.onResponseSelected("True");
                }
              },
            );
          },
          child: ResponseWidgetV2(
            title: "True",
            color: widget.wrongAnswers.contains("True")
                ? Colors.red
                : Colors.green,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(
              () {
                if (widget.responseSelectedIndex == 1) {
                  widget.responseSelectedIndex = -1;
                  widget.onResponseSelected(null);
                } else {
                  widget.responseSelectedIndex = 1;
                  widget.onResponseSelected("False");
                }
              },
            );
          },
          child: ResponseWidgetV2(
            title: "False",
            color: widget.wrongAnswers.contains("False")
                ? Colors.red
                : Colors.green,
          ),
        ),
      ],
    );
  }
}

class ResponseWidgetV2 extends StatelessWidget {
  const ResponseWidgetV2({
    super.key,
    required this.title,
    required this.color,
  });
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xffC7A8FC),
        elevation: 3,
        child: Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xffC7A8FC),
            border: Border.all(color: color, width: 2),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontFamily: kFontText,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
