import 'package:flutter/material.dart';



class Tip extends StatefulWidget {
  @override
  _TipState createState() => _TipState();
}

class _TipState extends State<Tip> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
          child: Container(

        height: 184,
        width: 379,
        decoration: BoxDecoration(
           color: Colors.amberAccent,
           image: DecorationImage(image: AssetImage("assets/images/q.jpg"),fit: BoxFit.cover),
           boxShadow: [
             BoxShadow(color: Colors.black.withOpacity(0.16),blurRadius: 10,offset: Offset(0, 0))
           ],
          borderRadius: BorderRadius.circular(25)
        ),
       
        child: Stack(
          children: <Widget>[
            
            Align(
              alignment: Alignment.bottomCenter,
                        child: Container(
                          child: Center(child: Text("سؤال و جواب",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xff55AA88)),),),
                height: 48.01,
                color: Colors.white,
              ),
            )
          ],

        ),
        
      ),
    );
  }
}