import 'package:flutter/material.dart';


class CityStatus extends StatelessWidget {
   final statusColor ;
 final title ;

  const CityStatus({Key key, this.statusColor, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: statusColor,
        centerTitle:true,
        title: Text(title.toString()),
        actions: [
          IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: (){
            Navigator.pop(context);
          })
        ],

      ),
    );
  }
}