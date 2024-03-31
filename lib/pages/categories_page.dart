import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/data.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({super.key});

  static String id = "/categoriesPage";

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final CategoriesData data = CategoriesData();

  int selectedIndex = -1; // Track the index of the selected container
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white, // Set underline color here
                        width: 1.0, // Set underline thickness here
                      ),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {},
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
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(bottom: 70, right: 12, left: 12),
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
                              ? const Color(0xffFECAAC)
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
