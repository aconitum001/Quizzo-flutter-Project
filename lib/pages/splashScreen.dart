import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/pages/onBoarding_page.dart';

class SplashSreen extends StatefulWidget {
  const SplashSreen({super.key});
  static String id = "Splashscreen";

  @override
  State<SplashSreen> createState() => _SplashSreenState();
}

class _SplashSreenState extends State<SplashSreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode((SystemUiMode.immersive));

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, OnBoardingPage.id);
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
        child: Image.asset("assets/images/logo 1.png"),
      ),
    );
  }
}
