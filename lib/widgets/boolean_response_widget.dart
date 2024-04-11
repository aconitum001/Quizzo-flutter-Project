// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class BooleanResponseWidget extends StatefulWidget {
  BooleanResponseWidget({
    super.key,
    required this.responseSelectedIndex,
    required this.onResponseSelected,
    required this.update,
  });
  int responseSelectedIndex;
  final void Function(int) update;
  final Function(String?) onResponseSelected;

  @override
  State<BooleanResponseWidget> createState() => _BooleanResponseWidgetState();
}

class _BooleanResponseWidgetState extends State<BooleanResponseWidget> {
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
                  widget.update(-1);
                  widget.onResponseSelected(null);
                } else {
                  widget.responseSelectedIndex = 0;
                  widget.update(0);
                  widget.onResponseSelected("True");
                }
              },
            );
          },
          child: ResponseWidgetV2(
            title: "True",
            color: widget.responseSelectedIndex == 0
                ? const Color(0xff6808C7)
                : Colors.transparent,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(
              () {
                if (widget.responseSelectedIndex == 1) {
                  widget.responseSelectedIndex = -1;
                  widget.update(-1);
                  widget.onResponseSelected(null);
                } else {
                  widget.responseSelectedIndex = 1;
                  widget.update(1);
                  widget.onResponseSelected("False");
                }
              },
            );
          },
          child: ResponseWidgetV2(
            title: "False",
            color: widget.responseSelectedIndex == 1
                ? const Color(0xff6808C7)
                : Colors.transparent,
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
