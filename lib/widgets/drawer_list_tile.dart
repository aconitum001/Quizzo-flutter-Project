import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 19,
        ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontFamily: kFontText,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
