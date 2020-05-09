import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SettingsItem extends StatelessWidget {
  final title ; 
  final route ;
  SettingsItem({this.title,this.route});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: Colors.white,
      child: GestureDetector(
        onTap:(){},
              child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: <Widget>[
                 
                  Container(
                
                    child: Icon(Icons.arrow_back_ios,color: Color(0xffC7C7CC),size: 18,)),
                    
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text(title,style: TextStyle(fontSize: 17,color: Color(0xff55AA88)),),
            ),
          ],
        ),
      ),
    );
  }
}