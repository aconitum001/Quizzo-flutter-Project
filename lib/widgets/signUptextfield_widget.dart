// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class SignUpTextField extends StatelessWidget {
  SignUpTextField({
    super.key,
    required this.hint,
    required this.icon,
    required this.onChange,
    this.obscure = false,
  });
  Function(String)? onChange;
  final IconData icon;
  final String hint;
  final bool obscure;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 14),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "This field is required";
              }
              return null;
            },
            obscureText: obscure,
            style: TextStyle(
              fontSize: 20,
              fontFamily: kFontText,
              fontWeight: FontWeight.w500,
            ),
            onChanged: onChange,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: 24,
                  fontFamily: kFontText,
                  fontWeight: FontWeight.w600,
                  color: kTextAccent,
                ),
                prefixIcon: Icon(
                  icon,
                  color: Colors.black,
                  size: 30,
                ),
                errorStyle: TextStyle(
                  fontFamily: kFontText,
                  fontSize: 14,
                ),
                fillColor: kTextAccent,
                focusColor: kTextAccent,
                hoverColor: kTextAccent,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: kTextAccent,
                    width: 3,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: kTextAccent,
                    width: 3,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: kTextAccent,
                    width: 3,
                  ),
                )),
          ),
          Positioned(
            right: -17,
            bottom: -13,
            child: RotatedBox(
              quarterTurns: 2,
              child: Icon(
                Icons.play_arrow,
                color: kTextAccent,
                size: 25,
              ),
            ),
          )
        ],
      ),
    );
  }
}
