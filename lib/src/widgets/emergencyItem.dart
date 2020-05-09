import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class EmergencyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: <Widget>[
               
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff55AA88)),
                    borderRadius: BorderRadius.circular(100)
                  )
                  ,child: Icon(Icons.arrow_downward,color: Color(0xff55AA88),size: 25,)),
                   Padding(
                     padding: const EdgeInsets.only(left:20.0),
                     child: Text('122',style: TextStyle(fontSize: 17),),
                   ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Text('الاسعاف',style: TextStyle(fontSize: 17,color: Color(0xff55AA88)),),
          ),
        ],
      ),
    );
  }
}