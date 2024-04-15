// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/helper/show_toast.dart';
import 'package:quiz_app/pages/cat_settings_page.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({
    super.key,
    required this.email,
  });

  final TextEditingController controller = TextEditingController();
  final String email;
  final CategoriesData catData = CategoriesData();
  int? catId;

  bool exist({required String catName, required List list}) {
    for (var cat in list) {
      if (cat["name"].toLowerCase() == catName) {
        catId = cat["id"];
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: TextField(
        controller: controller,
        onSubmitted: (data) {
          if (exist(
            catName: data.toLowerCase().trim(),
            list: catData.catList,
          )) {
            Navigator.push(
              context,
              PageTransition(
                child: CatSettingsPage(catId: catId!, email: email),
                type: PageTransitionType.rightToLeft,
                duration: const Duration(milliseconds: 300),
              ),
            );
            controller.clear();
          } else {
            toastFailure(
                message: "This category does not exist.", context: context);
            controller.clear();
          }
        },
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
