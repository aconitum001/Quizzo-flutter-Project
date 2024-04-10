import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/pages/tabs/first_tab.dart';
import 'package:quiz_app/pages/tabs/secound_tab.dart';
import 'package:quiz_app/pages/tabs/third_tab.dart';
import 'package:quiz_app/widgets/custom_searchbar.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({
    super.key,
    required this.username,
    required this.email,
    required this.score,
  });

  final String? username, email;
  static String id = "/homePageWidget";
  final int score;

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
          // resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            clipBehavior: Clip.none,
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            actions: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.account_balance,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "$score ",
                      style: TextStyle(
                        fontFamily: kFontText,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Image.asset("assets/images/man.png"),
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
                    "Hello, $username ",
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
                const CustomSearchBar(),
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
                                FirstTab(),
                                SecoundTab(),
                                ThirdTab(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
