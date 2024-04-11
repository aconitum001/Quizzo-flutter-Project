import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/user.dart';
import 'package:quiz_app/widgets/loading_widget.dart';

class LeaderBoardPage extends StatelessWidget {
  LeaderBoardPage({super.key});

  static String id = "/LeaderBoardPage";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("users")
          .orderBy("score", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: const LoadingWidget(),
            backgroundColor: kPrimaryColor,
          );
        } else if (snapshot.hasData) {
          List<User> users = [];
          List docIds = snapshot.data!.docs;
          for (int i = 0; i < docIds.length; i++) {
            users.add(User.fromjson(docIds[i].data()));
          }
          return Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        LeaderBoardContainer(
                          color: const Color(0xFFC0C0C0),
                          size: 12,
                          rank: 2,
                          score: users[1].score,
                          image: "assets/icons/knight.png",
                          name: users[1].userName,
                          bottom: 20,
                          width: 50,
                          height: 50,
                        ),
                        LeaderBoardContainer(
                          color: const Color(0xFFFFD700),
                          size: 14,
                          rank: 1,
                          score: users[0].score,
                          width: 70,
                          height: 70,
                          bottom: 50,
                          image: "assets/icons/king.png",
                          name: users[0].userName,
                        ),
                        LeaderBoardContainer(
                          color: const Color(0xFFCD7F32),
                          size: 12,
                          width: 50,
                          height: 50,
                          rank: 3,
                          score: users[2].score,
                          bottom: 20,
                          image: "assets/icons/jester.png",
                          name: users[2].userName,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListView.builder(
                        itemCount: users.length - 3,
                        itemBuilder: (context, index) => ListTile(
                          trailing: Container(
                            // padding: EdgeInsets.symmetric(vertical: 10),
                            width: 60,
                            height: 26,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xffAD8AE8),
                            ),
                            child: Center(
                              child: Text(
                                "${users[index + 3].score}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "DM Sans",
                                    color: Color(0xff2B262D)),
                              ),
                            ),
                          ),
                          leading: Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffAD8AE8),
                            ),
                            child: Center(
                              child: Text(
                                "${index + 3}",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: "Oldenburg",
                                    color: Color(0xff2B262D)),
                              ),
                            ),
                          ),
                          title: Text(
                            users[index + 3].userName,
                            style: const TextStyle(
                                fontSize: 20,
                                fontFamily: "Oldenburg",
                                color: Color(0xff2B262D)),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Text(snapshot.error.toString());
        }
      },
    );
  }
}

class LeaderBoardContainer extends StatelessWidget {
  const LeaderBoardContainer({
    super.key,
    required this.image,
    required this.name,
    required this.rank,
    required this.score,
    required this.size,
    required this.color,
    required this.bottom,
    required this.width,
    required this.height,
  });
  final String name, image;
  final int rank, score;
  final double size, bottom, width, height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: kFontText,
            fontSize: size,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10, top: 5),
          padding: const EdgeInsetsDirectional.all(10),
          decoration: BoxDecoration(
            color: const Color(0xffE4D9F8),
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 3),
          ),
          child: Image.asset(
            image,
            width: 70,
            height: 70,
          ),
        ),
        Container(
          width: 70,
          padding: EdgeInsets.only(bottom: bottom),
          decoration: const BoxDecoration(
            color: Color(0xffAD8AE8),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "$rank",
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: "DM Sans",
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${score}pts",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: kFontText,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
