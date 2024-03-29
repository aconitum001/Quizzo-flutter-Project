import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/pages/cubits/login_cubit/login_cubit.dart';
import 'package:quiz_app/pages/cubits/signup_cubit/signup_cubit.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/intro_pages/get_started.dart';
import 'package:quiz_app/pages/login_page.dart';
import 'package:quiz_app/pages/onBoarding_page.dart';
import 'package:quiz_app/pages/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Quiz());
}

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        )
      ],
      child: MaterialApp(
        title: "Quiz App",
        routes: {
          HomePage.id: (context) => const HomePage(),
          OnBoardingPage.id: (context) => OnBoardingPage(),
          GetStartedPage.id: (context) => const GetStartedPage(),
          LogInPage.id: (context) => LogInPage(),
          SignUpPage.id: (context) => SignUpPage(),
        },
        initialRoute: OnBoardingPage.id,
      ),
    );
  }
}
