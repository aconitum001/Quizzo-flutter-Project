// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:quiz_app/constants.dart';

import 'package:quiz_app/pages/firebase_services.dart/firestore.dart';

import 'package:quiz_app/widgets/home_page_widget.dart';
import 'package:quiz_app/widgets/loading_widget.dart';

class HomePage extends StatelessWidget {
  static String id = "/home_page";

  String? username;

  Map<String, dynamic>? data;

  bool isLoading = false;
  String? email;
  int? score;

  PersistentTabController controller = PersistentTabController();

  bool hide = false;

  @override
  Widget build(BuildContext context) {
    email = ModalRoute.of(context)!.settings.arguments as String;
    return PopScope(
      canPop: false,
      child: FutureBuilder(
        future: getUserDetails(id: email!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    kPrimaryColor,
                    const Color(0xff5C3B7E),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const LoadingWidget(
                color: Colors.white,
              ),
            );
          } else if (snapshot.hasData) {
            data = snapshot.data!.data() as Map<String, dynamic>;
            score = data!["score"];
            username = data!["username"];
            return HomePageWidget(
              username: username,
              email: email,
              score: score!,
            );
          } else {
            return Text(snapshot.error.toString());
          }
        },
      ),
    );
  }
}
