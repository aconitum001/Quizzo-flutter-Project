// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/widgets/label_widger.dart';

class ThirdProfileTab extends StatelessWidget {
  ThirdProfileTab({
    super.key,
    required this.data,
  });
  final Map<String, dynamic> data;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordContreoller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    usernameController.text = data["username"];
    passwordContreoller.text = data["password"];
    emailController.text = data["email"];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 39),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            const Label(
              text: "Username",
            ),
            const SizedBox(
              height: 2,
            ),
            ProfileTextField(usernameController: usernameController),
            const SizedBox(
              height: 20,
            ),
            const Label(
              text: "email",
            ),
            const SizedBox(
              height: 2,
            ),
            ProfileTextField(
              usernameController: emailController,
              enabled: false,
            ),
            const SizedBox(
              height: 20,
            ),
            const Label(
              text: "Password",
            ),
            const SizedBox(
              height: 2,
            ),
            ProfileTextField(
              usernameController: passwordContreoller,
              obscure: true,
              enabled: false,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    spreadRadius: 0,
                    blurRadius: 16,
                    offset: const Offset(5, 4), // changes position of shadow
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xff603D83), // Text color
                  elevation: 0, // No elevation for the button itself
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Update",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.bold,
                    color: Color(0xff603D83),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key,
    required this.usernameController,
    this.obscure = false,
    this.enabled = true,
  });

  final TextEditingController usernameController;
  final bool obscure, enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Field is required.";
        } else {
          return "";
        }
      },
      enabled: enabled,
      controller: usernameController,
      obscureText: obscure,
      style: TextStyle(
        fontFamily: kFontText,
        fontSize: 13,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        suffixIcon: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: Color(0xffA9A9A9),
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: Color(0xffA9A9A9),
            width: 1,
          ),
        ),
        focusColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: Color(0xffA9A9A9),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: Color(0xffA9A9A9),
            width: 1,
          ),
        ),
      ),
    );
  }
}
