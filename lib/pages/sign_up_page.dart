// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/helper/show_toast.dart';
import 'package:quiz_app/pages/cubits/homepage_cubit/homepage_cubit.dart';
import 'package:quiz_app/pages/cubits/signup_cubit/signup_cubit.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/widgets/ArrowButton.dart';
import 'package:quiz_app/widgets/signUptextfield_widget.dart';

class SignUpPage extends StatelessWidget {
  static String id = "/signUpPage";
  String? userName, email, password;
  bool isLoading = false;
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          isLoading = true;
        } else if (state is SignupSuccess) {
          BlocProvider.of<HomepageCubit>(context).getUserDetails(id: email!);
          toastSuccess(
              message: "You have Created An Account!", context: context);
          isLoading = false;
          Navigator.pushNamed(context, HomePage.id);
        } else if (state is SignupFailure) {
          isLoading = false;
          toastFailure(message: state.errMessage, context: context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/register_background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Form(
              key: formkey,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: ListView(
                  clipBehavior: Clip.none,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: Row(
                        children: [
                          ArrowButton(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 35,
                          fontFamily: kFontText,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w300,
                          shadows: [
                            Shadow(
                              offset: const Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SignUpTextField(
                      hint: "User Name",
                      icon: Icons.border_color,
                      onChange: (data) {
                        userName = data;
                      },
                    ),
                    SignUpTextField(
                      hint: "Email Address",
                      icon: Icons.mark_email_unread,
                      onChange: (data) {
                        email = data;
                      },
                    ),
                    SignUpTextField(
                      hint: "Password",
                      icon: Icons.lock,
                      obscure: true,
                      onChange: (data) {
                        password = data;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 41, vertical: 32),
                      child: MaterialButton(
                        elevation: 5,
                        height: 50,
                        minWidth: 320,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<SignupCubit>(context).signUpUser(
                              email: email!,
                              password: password,
                              userName: userName!,
                            );
                          }
                        },
                        color: kPrimaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: kFontText,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(width: 15),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        "OR",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: kFontText,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Already Have An Account",
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
            ),
          ),
        );
      },
    );
  }
}
