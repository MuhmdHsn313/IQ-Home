import 'package:flutter/material.dart';

class Rate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xffFFC34C),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              "assets/images/social-media.png",
              width: 62.67,
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              "قيم التطبيق 5 نجوم"
              "\n"
              "App Store على ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
