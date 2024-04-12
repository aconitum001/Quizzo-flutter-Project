import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.email});

  static String id = "/ProfilePage";
  final String email;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Profile"),
    );
  }
}
