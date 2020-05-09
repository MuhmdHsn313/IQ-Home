import 'package:flutter/material.dart';

class FontSize extends StatefulWidget {
  @override
  _FontSizeState createState() => _FontSizeState();
}

class _FontSizeState extends State<FontSize> {


  bool huge = false ; 
  bool big = false ; 
  bool reqular = true ; 
  bool small  = false ;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(alignment: Alignment.topRight, 
        child: Padding(
          padding: const EdgeInsets.only(right: 17),
          child: Text("حجم الخط",style: TextStyle(fontSize: 17,color: Color(0xff55AA88)),),
        )),
        Container(
          height: 48,
          color: Colors.white,
          child: Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  setState(() {
                      huge = true ;  big = false ;  reqular = false ;  small  = false ;
                    
                  });
                },
                              child: Container(
                  height: 31,
                  width: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(3),topLeft: Radius.circular(3)),
                    border: Border.all(color: Color(0xff55AA88),width: 1),
                    color: huge?Color(0xff55AA88):Colors.white
                  ),
                  child: Text("ضخم",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: huge?Colors.white:Color(0xff55AA88))),
                ),
              ),
               GestureDetector(
                 onTap: (){
                  setState(() {
                      huge = false ;  big = true ;  reqular = false ;  small  = false ;
                    
                  });
                },
                              child: Container(
                  height: 31,
                  width: 95,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(3),topLeft: Radius.circular(3)),
                    border: Border.all(color: Color(0xff55AA88),width: 1),
                    color: big?Color(0xff55AA88):Colors.white

                  ),
                  child:  Text("كبير",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: big?Colors.white:Color(0xff55AA88))),
                ),
              ),
               GestureDetector(
                 onTap: (){
                  setState(() {
                      huge = false ;  big = false ;  reqular = true ;  small  = false ;
                    
                  });
                },
                              child: Container(
                  height: 31,
                  width: 95,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(3),topLeft: Radius.circular(3)),
                    border: Border.all(color: Color(0xff55AA88),width: 1),
                    color: reqular?Color(0xff55AA88):Colors.white
                  ),
                  child:  Text("متوسط",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: reqular?Colors.white:Color(0xff55AA88))),
                ),
              ),
               GestureDetector(
                 onTap: (){
                  setState(() {
                      huge = false ;  big = false ;  reqular = false ;  small  = true ;
                    
                  });
                },
                              child: Container(
                  height: 31,
                  width: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(3),topRight: Radius.circular(3)),
                    border: Border.all(color: Color(0xff55AA88),width: 1),
                    color: small?Color(0xff55AA88):Colors.white
                  ),
                  child:  Text("صغير",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: small?Colors.white:Color(0xff55AA88))),
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(right: 32,left: 32,top: 10,bottom: 20),
          child: Text("""...هذا الخط هو مثال عن الحجم الذي اخترته 
       .  اختر ماينسابك من حجم الخط حيث يكون مريح في القراءة بالنسبة لك""",textAlign: TextAlign.end,style: TextStyle(
           color: Color(0xffB0B0B0) ,
           fontSize: huge?20:big?18:reqular?16:small?14:14
       ),),
        )
      ],
    );
  }
}
