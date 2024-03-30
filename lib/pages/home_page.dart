// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/pages/cubits/homepage_cubit/homepage_cubit.dart';
import 'package:quiz_app/pages/tabs/first_tab.dart';
import 'package:quiz_app/pages/tabs/secound_tab.dart';
import 'package:quiz_app/pages/tabs/third_tab.dart';
import 'package:quiz_app/widgets/custom_searchbar.dart';

class HomePage extends StatelessWidget {
  static String id = "/home_page";
  String? username;
  Map<String, dynamic>? data;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
      child: BlocConsumer<HomepageCubit, HomepageState>(
        listener: (context, state) {
          if (state is HomepageSuccess) {
            isLoading = false;
            data = state.snapshot.data() as Map<String, dynamic>;
            username = data!["username"];
          } else if (state is HomepageLoading) {
            isLoading = true;
          }
        },
        builder: (context, state) {
          return isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.purple,
                  ),
                )
              : DefaultTabController(
                  length: 3,
                  child: Scaffold(
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
                                  color: Colors.white),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Divider(
                                        color: Colors.deepPurple,
                                        thickness: 3,
                                        indent: 160,
                                        endIndent: 160,
                                      ),
                                    ),
                                    const TabBar(
                                      dividerColor: Colors.transparent,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      labelStyle: TextStyle(
                                          fontFamily: "Nunito", fontSize: 15),
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
                );
        },
      ),
    );
  }
}
