import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SettingsCheckBox extends StatefulWidget {
    final title  ;
  bool  value ;
  SettingsCheckBox({this.value,this.title});
  @override
  _SettingsCheckBoxState createState() => _SettingsCheckBoxState();
}

class _SettingsCheckBoxState extends State<SettingsCheckBox> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: Colors.white,




      child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        
       
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: CupertinoSwitch(value: widget.value, onChanged: (change){
            setState(() {
              widget.value = change ;
            });
          }),
        ),

        Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Text(widget.title,textAlign: TextAlign.end,style: TextStyle(fontSize: 17,color: Color(0xff55AA88)),),
          ),
      ],
      
      )

          
      //  child:   Padding(
      //       padding: const EdgeInsets.only(left: 25),
      //       child: SwitchListTile(value: _value, onChanged: (change){

      //         setState(() {
      //           _value = change ;
      //         });
              

      //       },

      //       title: Text("الوظع المظلم",textAlign: TextAlign.end,),
            
      //       ),
      //     ),
         
    );
  }
}