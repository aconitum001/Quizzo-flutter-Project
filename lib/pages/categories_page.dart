// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/pages/cat_settings_page.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({
    super.key,
    required this.hidenavbar,
    required this.email,
  });

  static String id = "/categoriesPage";
  bool hidenavbar;
  final String email;

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final CategoriesData data = CategoriesData();

  int selectedIndex = -1;
  int? catId;

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
      child: Column(
        children: [
          AppBar(
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 0),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white, // Set underline color here
                      width: 1.0, // Set underline thickness here
                    ),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    if (catId != null) {
                      pushScreenWithoutNavBar(
                        context,
                        CatSettingsPage(catId: catId!, email: widget.email),
                      );
                    }
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: "Oldenburg",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ],
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(right: 12, left: 12, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  children: [
                    const Text(
                      "Choose Category",
                      style: TextStyle(
                        fontSize: 35,
                        color: Color(0xff6808C7),
                        fontFamily: "Trocchi",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 150 / 125,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 30,
                        crossAxisCount: 2,
                      ),
                      itemCount: data.catList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedIndex == index) {
                              selectedIndex = -1;
                              catId = null;
                            } else {
                              selectedIndex = index;
                              catId = data.catList[index]["id"];
                            }
                          });
                        },
                        child: CustomContainer(
                          color: selectedIndex == index
                              ? const Color(0xffC7A8FC)
                              : const Color(0xffE2D7F6),
                          image: data.catList[index]["image"],
                          title: data.catList[index]["name"],
                          questionsNumber:
                              data.catList[index]["total_questions"].toString(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.image,
      required this.questionsNumber,
      required this.title,
      required this.color});

  final String image, title, questionsNumber;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: color,
      elevation: 5,
      child: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Image.asset(
              image,
              width: 53,
              height: 58,
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              title,
              style: const TextStyle(
                fontFamily: "OldenBurg",
                fontSize: 14,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              " $questionsNumber Questions",
              style: const TextStyle(
                fontFamily: "Nunito",
                fontSize: 9,
                color: Colors.white,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
