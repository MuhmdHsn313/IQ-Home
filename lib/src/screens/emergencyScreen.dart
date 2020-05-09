import 'package:flutter/material.dart';
import 'package:iqhome/src/widgets/emergencyItem.dart';



class EmergencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff55AA88),
        elevation: 0.0,
        centerTitle: true,
        title: Text("ارقام الطوارئ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        actions: <Widget>[
          
          GestureDetector(
            onTap: (){

            },
            child: Row(
              children: <Widget>[
                Center(child: Text("الرئيسية",style:TextStyle(fontSize: 15))),
          Icon(Icons.arrow_forward_ios),

              ],
            ),
          )
          
        ],
      ),

      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom:20),
              child: Container(
                height: 179,
                decoration: BoxDecoration(
               image: DecorationImage(image: AssetImage("assets/emergency.jpg"),fit: BoxFit.cover),
          ),
              ),
            ),

            Align(alignment: Alignment.topRight,child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text("* اضغط على الجهة التي تريد الاتصال بها",textAlign: TextAlign.end,style: TextStyle(fontSize: 10),),
            )),

            Expanded(
              child: ListView(children: <Widget>[
                EmergencyItem()
              ],),
            )

          ],
        ),
      ),
    );
  }
}