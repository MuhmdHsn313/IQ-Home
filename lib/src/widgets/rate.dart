import 'package:flutter/material.dart';

class Rate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Color(0xffFFC34C), borderRadius: BorderRadius.circular(25)),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
            left: 90,
            child: Text(
              """قيم التطبيق 5 نجوم
App Store على """,
textAlign: TextAlign.end,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),

          Positioned(
            top: 11.5,
            right: 15,
              child: Image.asset(
            "assets/images/social-media.png",
            width: 62.67,
          ))
          //  Positioned(
          //    right: 10,
          //    top: 10,
          //               child: Container(
          //         height: 2.08,
          //         decoration: BoxDecoration(
          //        image: DecorationImage(image: AssetImage("assets/social-media.png"),fit: BoxFit.cover),
          // ),
          //       ),
          //  ),
        ],
      ),
    );
  }
}
