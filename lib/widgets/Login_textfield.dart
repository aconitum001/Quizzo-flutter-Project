// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.icon,
    required this.label,
    required this.onSubmitted,
    this.obscure = false,
  });
  final IconData icon;
  final String label;
  final Function(String)? onSubmitted;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(3, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
          ),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "This field is required.";
              }
            },
            obscureText: obscure,
            onChanged: onSubmitted,
            style: TextStyle(
              fontSize: 16,
              fontFamily: kFontText,
            ),
            decoration: InputDecoration(
              prefixIcon: Container(
                margin: const EdgeInsets.only(right: 15),
                width: 66,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  color: kPrimaryColor,
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              hintText: label,
              hintStyle: TextStyle(fontSize: 16, fontFamily: kFontText),
              focusColor: Colors.white,
              hoverColor: Colors.white,
              contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
              isDense: true,
              errorStyle: TextStyle(
                fontFamily: kFontText,
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
