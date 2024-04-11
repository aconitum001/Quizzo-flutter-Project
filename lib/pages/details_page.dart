import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class AddPage extends StatelessWidget {
  const AddPage({
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kPrimaryColor,
            const Color(0xff5C3B7E),
          ],
        ),
      ),
      child: Column(
        children: [
          AppBar(
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
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 12, left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
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
                    ),
                    const Text(
                      "Quiz details",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Oldenburg",
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 64,
                      decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.36),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomDetailedContainer(
                              icon: Icons.article_outlined,
                            ),
                            CustomDetailedText(
                              text: "1 Question",
                            ),
                            CustomDetailedContainer(
                              icon: Icons.access_alarm,
                            ),
                            CustomDetailedText(
                              text: "1 Minute",
                            ),
                            CustomDetailedContainer(
                              icon: Icons.star_outline,
                            ),
                            CustomDetailedText(
                              text: "10 Points",
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    const Text(
                      "Brief explanation about quiz",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Oldenburg",
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const CustomListTile(
                      title:
                          "10 points awarded for a correct answer and no points for a incorrect answer",
                    ),
                    const CustomListTile(
                      title: "1 Minute allotted to answer one question. ",
                    ),
                    const CustomListTile(
                      title: "Tap on options to select the correct answer",
                    ),
                    const CustomListTile(
                      title: "Tap on button Next to move to the next question",
                    ),
                    const CustomListTile(
                      title: "Click submit if you completed all the questions",
                    ),
                    const Spacer(
                      flex: 4,
                    ),
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

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Icon(
              Icons.circle,
              size: 11,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: "Nunito",
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDetailedText extends StatelessWidget {
  const CustomDetailedText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: "Ubuntu",
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }
}

class CustomDetailedContainer extends StatelessWidget {
  const CustomDetailedContainer({
    super.key,
    required this.icon,
  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff8251DE),
            Color(0xff462C78),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
