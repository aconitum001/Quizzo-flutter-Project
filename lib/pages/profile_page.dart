import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/profile_tabs/first_tab.dart';
import 'package:quiz_app/pages/profile_tabs/secound_tab.dart';
import 'package:quiz_app/pages/profile_tabs/third_tab.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.email,
    required this.data,
  });

  static String id = "/ProfilePage";
  final String email;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffA76AE4),
              Color(0xff5C3B7E),
            ],
          ),
        ),
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(
                        context,
                        HomePage.id,
                        arguments: email,
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/man.png",
                  width: 70,
                  height: 70,
                ),
                Center(
                  child: Text(
                    data["username"],
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      fontFamily: kFontText,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TabBar(
                  indicatorPadding: const EdgeInsets.only(right: 20),
                  indicatorColor: Colors.white,
                  dividerColor: Colors.transparent,
                  padding: const EdgeInsets.only(left: 10),
                  tabs: [
                    Tab(
                      icon: Container(
                        padding: const EdgeInsets.only(right: 20),
                        height: 25,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Stats",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: kFontText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        height: 25,
                        padding: const EdgeInsets.only(right: 25),
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "History",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: kFontText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        padding: const EdgeInsets.only(right: 15),
                        child: Center(
                          child: Text(
                            "Edit profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: kFontText,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(children: [
                    FirstProfileTab(data: data),
                    SecoundProfileTab(data: data),
                    const ThirdProfileTab(),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
