import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/pages/login_page.dart';
import 'package:quiz_app/pages/sign_up_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});
  static String id = "/GetStartedPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/onboarding_background.png"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 11,
              ),
              Image.asset(kLogo),
              const Spacer(
                flex: 1,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      "LogIn Or Sign up",
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            offset: const Offset(0, 2), // Offset of the shadow
                            color: Colors.black.withOpacity(
                                0.5), // Color of the shadow with some opacity
                            blurRadius: 4, // Amount of blur for the shadow
                          ),
                        ],
                        fontSize: 20,
                        fontFamily: kFontText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    MaterialButton(
                      elevation: 6,
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: LogInPage(),
                            type: PageTransitionType.fade,
                            duration: const Duration(milliseconds: 500),
                            reverseDuration: const Duration(milliseconds: 500),
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: kPrimaryColor,
                      minWidth: MediaQuery.of(context).size.width * 0.78,
                      height: 50,
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          fontFamily: kFontText,
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    MaterialButton(
                      elevation: 6,
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: SignUpPage(),
                            type: PageTransitionType.fade,
                            duration: const Duration(milliseconds: 500),
                            reverseDuration: const Duration(milliseconds: 500),
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: const Color(0xFFDEDEDE),
                      minWidth: MediaQuery.of(context).size.width * 0.78,
                      height: 50,
                      child: Text(
                        "Create an Account",
                        style: TextStyle(
                          color: const Color(0xFF6808C7),
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          fontFamily: kFontText,
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
