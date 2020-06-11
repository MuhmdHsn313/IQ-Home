import 'package:flutter/material.dart';
import 'package:iqhome/src/widgets/in_status_card.dart';



class InStatus extends StatelessWidget {
   final statusColor = Color(0xffEE3030);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: [
          Container(
            height: 251,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Color(0xff000000).withOpacity(0.16),blurRadius: 10),
              ]
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             Text("المصابون",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: statusColor),)
            ],),
          ),

SizedBox(height: 17,),

Expanded(
  child:   GridView.builder(
    itemCount: 10,
    physics: BouncingScrollPhysics(),
    
    
    
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2,mainAxisSpacing: 8,crossAxisSpacing: 17),
     itemBuilder: (BuildContext context, int index) { 
       return 
         
         Padding(
           padding: const EdgeInsets.only(left: 8,right: 8),
           child: InStatusCard(statusColor: statusColor,),
         );
      

      },
    

  


  
  
  
  
  
  
  
  ),
)



        ],
      ),
    );
  }
}