import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iqhome/src/widgets/emergency_number.dart';

class EmergencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("ارقام الطوارئ"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              height: 179,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/emergency.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              "* اضغط على الجهة التي تريد الاتصال بها",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(color: Theme.of(context).disabledColor),
            ),
          ),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => EmergencyNumber(),
              separatorBuilder: (context, index) => SizedBox(
                height: 5,
              ),
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
