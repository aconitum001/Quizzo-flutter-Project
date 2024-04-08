import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class ResponseContainer extends StatelessWidget {
  const ResponseContainer(
      {super.key,
      required this.response,
      required this.order,
      required this.color});
  final String order;
  final String response;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        borderRadius: BorderRadius.circular(14),
        color: Colors.transparent,
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xffC7A8FC),
            border: Border.all(
              color: color,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 43,
                height: 36,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    order,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  response,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
