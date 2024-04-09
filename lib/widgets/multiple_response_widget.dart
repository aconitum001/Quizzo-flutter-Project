import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/response_container.dart';

// ignore: must_be_immutable
class MultipleResponseWidget extends StatefulWidget {
  MultipleResponseWidget({
    super.key,
    required this.responseSelectedIndex,
    required this.answers,
    required this.onResponseSelected,
  });
  int responseSelectedIndex;
  final List<dynamic> answers;

  final Function(String?) onResponseSelected;

  @override
  State<MultipleResponseWidget> createState() => _MultipleResponseWidgetState();
}

class _MultipleResponseWidgetState extends State<MultipleResponseWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (widget.responseSelectedIndex == 0) {
                // Deselect the currently selected response
                widget.responseSelectedIndex = -1;
                widget.onResponseSelected(null);
              } else {
                // Select the tapped response
                widget.responseSelectedIndex = 0;
                widget.onResponseSelected(widget.answers[0]);
              }
            });
          },
          child: ResponseContainer(
            response: widget.answers[0]
                .replaceAll("&#039;", "'")
                .replaceAll("&quot;", '"')
                .replaceAll("&amp;", "&"),
            order: "A",
            color: widget.responseSelectedIndex == 0
                ? const Color(0xff6808C7)
                : Colors.transparent,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (widget.responseSelectedIndex == 1) {
                // Deselect the currently selected response
                widget.responseSelectedIndex = -1;
                widget.onResponseSelected(null);
              } else {
                // Select the tapped response
                widget.responseSelectedIndex = 1;
                widget.onResponseSelected(widget.answers[1]);
              }
            });
          },
          child: ResponseContainer(
            response: widget.answers[1]
                .replaceAll("&#039;", "'")
                .replaceAll("&quot;", '"')
                .replaceAll("&amp;", "&"),
            order: "B",
            color: widget.responseSelectedIndex == 1
                ? const Color(0xff6808C7)
                : Colors.transparent,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (widget.responseSelectedIndex == 2) {
                // Deselect the currently selected response
                widget.responseSelectedIndex = -1;
                widget.onResponseSelected(null);
              } else {
                // Select the tapped response
                widget.responseSelectedIndex = 2;
                widget.onResponseSelected(widget.answers[2]);
              }
            });
          },
          child: ResponseContainer(
            response: widget.answers[2]
                .replaceAll("&#039;", "'")
                .replaceAll("&quot;", '"')
                .replaceAll("&amp;", "&"),
            order: "C",
            color: widget.responseSelectedIndex == 2
                ? const Color(0xff6808C7)
                : Colors.transparent,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (widget.responseSelectedIndex == 3) {
                // Deselect the currently selected response
                widget.responseSelectedIndex = -1;
                widget.onResponseSelected(null);
              } else {
                // Select the tapped response
                widget.responseSelectedIndex = 3;
                widget.onResponseSelected(widget.answers[3]);
              }
            });
          },
          child: ResponseContainer(
            response: widget.answers[3]
                .replaceAll("&#039;", "'")
                .replaceAll("&quot;", '"')
                .replaceAll("&amp;", "&"),
            order: "D",
            color: widget.responseSelectedIndex == 3
                ? const Color(0xff6808C7)
                : Colors.transparent,
          ),
        ),
      ],
    );
  }
}
