import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: TextField(
        style: TextStyle(
          fontSize: 13,
          fontFamily: kFontText,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(
            fontFamily: kFontText,
            fontSize: 13,
            color: const Color(0xffD9D9D9),
          ),
          fillColor: Colors.white,
          focusColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.all(5),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xff643EAB),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
