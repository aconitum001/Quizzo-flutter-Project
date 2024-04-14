import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quiz_app/pages/onBoarding_page.dart';

class SplashSreen extends StatefulWidget {
  const SplashSreen({Key? key}) : super(key: key);
  static String id = "Splashscreen";

  @override
  State<SplashSreen> createState() => _SplashSreenState();
}

class _SplashSreenState extends State<SplashSreen> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode((SystemUiMode.immersive));

    // Delay the appearance of the logo
    Future.delayed(const Duration(milliseconds: 1300), () {
      setState(() {
        _isVisible = true;
      });
    });

    // Navigate after 2 seconds
    Future.delayed(const Duration(milliseconds: 5600), () {
      Navigator.pushReplacement(
        context,
        PageTransition(
          child: OnBoardingPage(),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 600),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/onboarding_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: AnimatedOpacity(
          duration:
              const Duration(milliseconds: 3000), // Duration of the animation
          opacity: _isVisible ? 1.0 : 0.0, // Set opacity based on visibility
          child: Image.asset("assets/images/logo 1.png"),
        ),
      ),
    );
  }
}
