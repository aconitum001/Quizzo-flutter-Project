// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/pages/details_page.dart';
import 'package:quiz_app/pages/categories_page.dart';

import 'package:quiz_app/pages/firebase_services.dart/firestore.dart';
import 'package:quiz_app/pages/leader_board_page.dart';
import 'package:quiz_app/pages/profile_page.dart';
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
    return FutureBuilder(
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
            child: const LoadingWidget(),
          );
        } else if (snapshot.hasData) {
          data = snapshot.data!.data() as Map<String, dynamic>;
          score = data!["score"];
          username = data!["username"];
          return PersistentTabView(
            resizeToAvoidBottomInset: true,
            handleAndroidBackButtonPress: true,
            hideNavigationBar: hide,
            navBarHeight: 60,
            controller: controller,
            tabs: [
              PersistentTabConfig(
                screen: HomePageWidget(
                  email: email,
                  username: username,
                  score: score!,
                ),
                item: ItemConfig(
                  activeForegroundColor: const Color(0xff613DA6),
                  inactiveIcon: const Icon(Icons.home_outlined),
                  icon: const Icon(Icons.home_rounded),
                  textStyle: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                  ),
                  title: "Home",
                ),
              ),
              PersistentTabConfig(
                screen: CategoriesPage(
                  email: email!,
                  hidenavbar: hide,
                ),
                item: ItemConfig(
                  activeForegroundColor: const Color(0xff613DA6),
                  icon: const Icon(Icons.grid_view_rounded),
                  inactiveIcon: const Icon(Icons.grid_view_outlined),
                  title: "Categories",
                  textStyle: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                  ),
                ),
              ),
              PersistentTabConfig(
                screen: const AddPage(),
                item: ItemConfig(
                  icon: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 3),
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                        ),
                      ],
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff8251DE),
                          Color(0xff462C78),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  textStyle: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
              PersistentTabConfig(
                screen: LeaderBoardPage(),
                item: ItemConfig(
                  icon: const Icon(Icons.emoji_events),
                  inactiveIcon: const Icon(Icons.emoji_events_outlined),
                  activeForegroundColor: const Color(0xff613DA6),
                  title: "LeaderBoard",
                  textStyle: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                  ),
                ),
              ),
              PersistentTabConfig(
                screen: const ProfilePage(),
                item: ItemConfig(
                  activeForegroundColor: const Color(0xff613DA6),
                  icon: const Icon(Icons.person),
                  inactiveIcon: const Icon(Icons.person_outline_outlined),
                  title: "Profile",
                  textStyle: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                  ),
                ),
              ),
            ],
            navBarBuilder: (navBarConfig) =>
                Style13BottomNavBar(navBarConfig: navBarConfig),
          );
        } else {
          return Text(snapshot.error.toString());
        }
      },
    );
  }
}
