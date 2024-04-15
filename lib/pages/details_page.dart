import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/pages/home_page.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key, required this.email});
  final String email;
  final AudioPlayer player = AudioPlayer();
  Future<void> playSound() async {
    String soundPath =
        "sounds/click-button-app-147358.mp3"; //You don't need to include assets/ because AssetSource assume that you have sound in your assets folder.
    await player.play(AssetSource(soundPath));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
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
                                  text: "30 seconds",
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
                          title: "30 seconds allotted to answer one question. ",
                        ),
                        const CustomListTile(
                          title: "Tap on options to select the correct answer",
                        ),
                        const CustomListTile(
                          title:
                              "Tap on button Next to move to the next question",
                        ),
                        const CustomListTile(
                          title:
                              "Click submit if you completed all the questions",
                        ),
                        const Spacer(
                          flex: 4,
                        ),
                        GestureDetector(
                          onTap: () {
                            playSound();
                            Navigator.popAndPushNamed(
                              context,
                              HomePage.id,
                              arguments: email,
                            );
                          },
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
                            child: const Row(
                              children: [
                                Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  "Let's Play",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Ubuntu",
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
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
        fontSize: 13.5,
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
