// ignore_for_file: must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/helper/showcaseview.dart';
import 'package:quiz_app/pages/cat_settings_page.dart';
import 'package:quiz_app/pages/details_page.dart';
import 'package:quiz_app/pages/leader_board_page.dart';
import 'package:quiz_app/pages/login_page.dart';
import 'package:quiz_app/pages/profile_page.dart';
import 'package:quiz_app/pages/homePage_tabs/first_tab.dart';
import 'package:quiz_app/pages/homePage_tabs/secound_tab.dart';
import 'package:quiz_app/pages/homePage_tabs/third_tab.dart';
import 'package:quiz_app/widgets/custom_searchbar.dart';
import 'package:quiz_app/widgets/drawer_list_tile.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
    required this.username,
    required this.email,
    required this.score,
    required this.data,
    this.first = false,
  });

  final String? username, email;
  static String id = "/homePageWidget";
  final int score;
  final Map<String, dynamic> data;
  final bool first;

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int selectedIndex = -1;
  int? idCat;
  final AudioPlayer player = AudioPlayer();
  final GlobalKey globalKeyOne = GlobalKey();
  final GlobalKey globalKeyTwo = GlobalKey();
  final GlobalKey globalKeyThree = GlobalKey();
  final GlobalKey globalKeyFour = GlobalKey();
  final GlobalKey globalKeyFive = GlobalKey();

  @override
  void initState() {
    if (widget.first) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => ShowCaseWidget.of(context).startShowCase(
          [
            globalKeyOne,
            globalKeyTwo,
            globalKeyThree,
            globalKeyFour,
            globalKeyFive,
          ],
        ),
      );
    }

    super.initState();
  }

  Future<void> playSound() async {
    String soundPath =
        "sounds/click-button-app-147358.mp3"; //You don't need to include assets/ because AssetSource assume that you have sound in your assets folder.
    await player.play(AssetSource(soundPath));
  }

  void updateIndex(int index, int? id) {
    selectedIndex = index;
    idCat = id;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
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
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: SafeArea(
            child: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Color(0xffA166DC),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/man.png",
                          width: 74,
                          height: 74,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.username!,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: kFontText,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " ${widget.score} points",
                          style: TextStyle(
                            fontSize: 12.7,
                            fontWeight: FontWeight.w300,
                            fontFamily: kFontText,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  DrawerListTile(
                    onTap: () {},
                    icon: Icons.home,
                    title: "Home",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DrawerListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        PageTransition(
                          child: AddPage(email: widget.email!),
                          type: PageTransitionType.rightToLeft,
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                        ),
                      );
                    },
                    icon: Icons.help_outline,
                    title: "Game Guide",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DrawerListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        PageTransition(
                          child: ProfilePage(
                              email: widget.email!, data: widget.data),
                          type: PageTransitionType.rightToLeft,
                          duration: const Duration(milliseconds: 300),
                        ),
                      );
                    },
                    icon: Icons.person_outline,
                    title: "Account",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DrawerListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: LeaderBoardPage(email: widget.email!),
                          type: PageTransitionType.rightToLeft,
                          duration: const Duration(milliseconds: 300),
                        ),
                      );
                    },
                    icon: Icons.emoji_events_outlined,
                    title: "Leaderboard",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DrawerListTile(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.popAndPushNamed(context, LogInPage.id);
                    },
                    icon: Icons.logout,
                    title: "Logout",
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            clipBehavior: Clip.none,
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                Builder(
                  builder: (context) => ShowCaseView(
                    globalKey: globalKeyOne,
                    title: "Explore Navigation Options",
                    description:
                        "Access different sections and features through the navigation menu.",
                    child: IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child:
                          ProfilePage(email: widget.email!, data: widget.data),
                      type: PageTransitionType.size,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 500),
                      reverseDuration: const Duration(milliseconds: 500),
                    ),
                  );
                },
                child: ShowCaseView(
                  globalKey: globalKeyTwo,
                  title: "Your Personal Space",
                  description:
                      "Discover stats, game history, and profile details effortlessly. Dive into insights, review game history, and manage profile settings.",
                  child: Image.asset("assets/images/man.png"),
                ),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: Text(
                    "Hello, ${widget.username} ",
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'DM Sans',
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36),
                  child: Text(
                    "Let's test your knowledge",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: "Ubuntu",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ShowCaseView(
                  globalKey: globalKeyThree,
                  title: "Quick Category Search",
                  description:
                      "Easily find specific categories by typing keywords into the search bar.",
                  child: CustomSearchBar(
                    email: widget.email!,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 12,
                      left: 12,
                      top: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                              bottom: 10,
                            ),
                            width: 55,
                            height: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  kPrimaryColor,
                                  const Color(0xff5C3B7E),
                                ],
                              ),
                            ),
                          ),
                          const TabBar(
                            labelPadding: EdgeInsets.all(1),
                            dividerColor: Colors.transparent,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            labelStyle:
                                TextStyle(fontFamily: "Nunito", fontSize: 15),
                            tabs: [
                              Tab(
                                text: "Popular",
                              ),
                              Tab(
                                text: "Entertainment",
                              ),
                              Tab(
                                text: "Science",
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                ShowCaseView(
                                  globalKey: globalKeyFour,
                                  title: "Explore Topic Categories",
                                  description:
                                      "Select a category to delve into quizzes related to specific subjects.",
                                  child: FirstTab(
                                    updateIndex: updateIndex,
                                  ),
                                ),
                                SecoundTab(
                                  updateIndex: updateIndex,
                                ),
                                ThirdTab(
                                  updateIndex: updateIndex,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (selectedIndex != -1) {
                                playSound();
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    child: CatSettingsPage(
                                      catId: idCat!,
                                      email: widget.email!,
                                    ),
                                    type: PageTransitionType.rightToLeft,
                                    duration: const Duration(milliseconds: 300),
                                  ),
                                );
                              }
                            },
                            child: ShowCaseView(
                              globalKey: globalKeyFive,
                              title: "Begin Your Quiz Journey",
                              description:
                                  "Tap here to start your quiz adventure and test your knowledge!",
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 15,
                                  top: 0,
                                ),
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff8251DE),
                                      Color(0xff462C78),
                                    ],
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Start Quiz",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Ubuntu",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
