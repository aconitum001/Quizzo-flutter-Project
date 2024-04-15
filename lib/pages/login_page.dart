// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/helper/show_toast.dart';

import 'package:quiz_app/pages/cubits/login_cubit/login_cubit.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/sign_up_page.dart';
import 'package:quiz_app/widgets/ArrowButton.dart';
import 'package:quiz_app/widgets/Login_textfield.dart';

class LogInPage extends StatelessWidget {
  static String id = "/LoginPage";
  String? email, password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          toastSuccess(message: "Welcome to Quizzo!", context: context);
          isLoading = false;
          Navigator.pushNamed(context, HomePage.id, arguments: email);
        } else if (state is LoginFailure) {
          isLoading = false;
          toastFailure(message: state.errMessage, context: context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Form(
            key: formKey,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/login_background.png",
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 24),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          const Row(
                            children: [
                              ArrowButton(),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                          ),
                          Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 35,
                                fontFamily: kFontText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          CustomTextField(
                            icon: Icons.email_outlined,
                            label: "Email Address",
                            onSubmitted: (data) {
                              email = data;
                            },
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          CustomTextField(
                            icon: Icons.lock_outline,
                            label: "Password",
                            suffixIcon: true,
                            obscure: true,
                            onSubmitted: (data) {
                              password = data;
                            },
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: MaterialButton(
                              elevation: 5,
                              height: 50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<LoginCubit>(context)
                                      .LoginUser(
                                          email: email, password: password);
                                }
                              },
                              color: kPrimaryColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Log in",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: kFontText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  const Icon(Icons.arrow_forward,
                                      color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            "OR",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: kFontText,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    child: SignUpPage(),
                                    type: PageTransitionType.rightToLeft,
                                  ));
                            },
                            child: Text(
                              "Create New Account",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: kTextAccent,
                                color: kTextAccent,
                                fontFamily: kFontText,
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
