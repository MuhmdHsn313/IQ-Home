import 'package:flutter/material.dart';

class NavButtom extends StatefulWidget {
  @override
  _NavButtomState createState() => _NavButtomState();
}

class _NavButtomState extends State<NavButtom> {
  Color infoColor = Color(0xff727272);
  Color homeColor = Color(0xff55AA88);
  Color statisticColor = Color(0xff727272);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.16),
              blurRadius: 10,
              offset: Offset(0, 0))
        ],
      ),
      height: 50,
      width: 172,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              highlightColor: Colors.transparent,
              icon: Icon(
                Icons.info,
                size: 30,
                color: infoColor,
              ),
              onPressed: () {
                setState(() {
                  infoColor = Color(0xff55AA88);
                  homeColor = Color(0xff727272);
                  statisticColor = Color(0xff727272);
                });
              }),
          IconButton(
              highlightColor: Colors.transparent,
              icon: Icon(
                Icons.home,
                size: 30,
                color: homeColor,
              ),
              onPressed: () {
                setState(() {
                  infoColor = Color(0xff727272);
                  homeColor = Color(0xff55AA88);
                  statisticColor = Color(0xff727272);
                });
              }),
          IconButton(
              highlightColor: Colors.transparent,
              icon: Icon(
                Icons.slow_motion_video,
                size: 30,
                color: statisticColor,
              ),
              onPressed: () {
                setState(() {
                  infoColor = Color(0xff727272);
                  homeColor = Color(0xff727272);
                  statisticColor = Color(0xff55AA88);
                });
              })
        ],
      ),
    );
  }
}
