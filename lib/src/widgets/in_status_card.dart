import 'package:flutter/material.dart';
import 'package:iqhome/src/models/area_statics.dart';
import 'package:iqhome/src/screens/state_details.dart';

class InStatusCard extends StatelessWidget {
  final AreaStatics statics;

  const InStatusCard({
    Key key,
    @required this.statics,
  })  : assert(statics != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StateDetails()),
      ),
      child: Container(
        height: 95,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              color: Color(0xff000000).withOpacity(0.16),
              blurRadius: 6,
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: Color(0xffDADADA),
              ),
              height: 40,
              child: Stack(
                children: [
                  Positioned(
                    right: 67,
                    top: 7,
                    child: Text(
                      statics.name,
                      style: TextStyle(
                        color: Theme.of(context).errorColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 9.8,
                    top: 12.5,
                    bottom: 11.4,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40,
              child: Container(
                height: 55,
                width: 180,
                child: Stack(
                  children: [
                    Positioned(
                      top: 14,
                      right: 14,
                      child: Text(
                        statics.deaths,
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).errorColor,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      left: 15,
                      child: Text(
                        statics.cases,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 37,
                          color: Theme.of(context).errorColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
