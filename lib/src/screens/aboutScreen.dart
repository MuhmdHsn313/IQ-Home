import 'package:flutter/material.dart';
import 'package:iqhome/src/widgets/tip.dart';




class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
     child: ListView(
       children: <Widget>[
        Container(
          height: 226,
         width: MediaQuery.of(context).size.width,

          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/who-cover.png"),fit: BoxFit.cover),
          ),
        ),

        SizedBox(height: 35,),
        Padding(padding: EdgeInsets.only(left: 13,right: 13),
        child: Tip(),)
      ],)
      
    );
  }
}