import 'package:flutter/material.dart';
import 'package:iqhome/src/screens/city_in_status.dart';





class InStatusCard extends StatelessWidget {

 final statusColor ;
 final title ;
 final numberOfday ;
 final number ;
 InStatusCard({this.statusColor,this.title,this.numberOfday,this.number});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Navigator.push(context, MaterialPageRoute(builder: (context){

          return CityStatus(statusColor: statusColor,title: "بغداد",);

        }));

      },
          child: Container(
        // margin: EdgeInsets.only(bottom: 8),

        height: 95,
       
        
        decoration: BoxDecoration(
          color: Colors.white,
        
        borderRadius: BorderRadius.circular(12),
          

          boxShadow: [
            
            BoxShadow(offset: Offset(0, 3),color: Color(0xff000000).withOpacity(0.16),blurRadius: 6),
          ]
        ),

        child: Stack(
          children: [

                      Container(
              
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                  color: Color(0xffDADADA),
              ),
              height: 40,
              
              child: Stack(
                children: [
                  Positioned(
                    right: 67,
                    top: 7,
                    
                    child: Text("بغداد",style: TextStyle(color: statusColor,fontSize: 20),),),
                  Positioned(
                    left: 9.8,
                    top: 12.5,
                    bottom: 11.4,
                    child: Icon(Icons.arrow_forward_ios,size: 20,))
                ],
              ),
            ),


                 Positioned(
                   top: 40,
                                  child: Container(
              decoration: BoxDecoration(
                 
                    
              ),
               height: 55,
                width: 180,
             
              child: Stack(
                
                children: [
                    Positioned(
                      top: 14,
                      right: 14,
                      child: Text("اليوم + 22",style: TextStyle(fontSize: 18,color: statusColor),)),
                    
                      Positioned(
                        bottom: 1,
                        left: 15,
                      child: Text("462",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 37,color: statusColor),)),
                    
                ],
              ),
            ),
                 )

          ],
        ),

        // child: Column(
        //   children: [
        //     Container(
        //        width: 180,
        //       decoration: BoxDecoration(
        //          borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
        //           color: Color(0xffDADADA),
        //       ),
        //       height: 40,
              
        //       child: Stack(
        //         children: [
        //           Center(child: Text("بغداد"),),
        //           Positioned(
        //             left: 9.8,
        //             top: 12.5,
        //             bottom: 11.4,
        //             child: Icon(Icons.arrow_back_ios))
        //         ],
        //       ),
        //     ),
        //     Container(
        //       decoration: BoxDecoration(
        //          borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12)),
        //           color: Colors.white,
        //       ),
        //        height: 55,
        //         width: 180,
             
        //       child: Stack(
                
        //         children: [
        //           Positioned(
        //             top: 14,
        //             right: 14,
        //             child: Text("اليوم + 22")),
                  
        //             Positioned(
        //               bottom: 1,
        //               left: 15,
        //             child: Text("462",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 37),)),
                  
        //         ],
        //       ),
        //     )

        //   ],
        // ),
        
      ),
    );
  }
}