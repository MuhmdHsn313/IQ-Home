import 'package:flutter/material.dart';
import 'package:iqhome/src/widgets/fontSize.dart';
import 'package:iqhome/src/widgets/rate.dart';
import 'package:iqhome/src/widgets/seetingsCheckBox.dart';
import 'package:iqhome/src/widgets/seetingsItem.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff55AA88),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "الأعدادات",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 27, top: 14, right: 18, left: 18),
              child: Rate(),
            ),
            FontSizeWidget(),
            SettingsCheckBox("الوضع المظلم"),
            SizedBox(
              height: 13.5,
            ),
            SettingsCheckBox("الأشعارات"),
            SizedBox(
              height: 45,
            ),
            SettingsItem(
              title: "مصادرنا (المواقع الرسمية)",
            ),
            SizedBox(
              height: 8,
            ),
            SettingsItem(
              title: "عن التطبيق",
            ),
            SizedBox(
              height: 8,
            ),
            SettingsItem(
              title: "من نحن",
            ),
            SizedBox(
              height: 8,
            ),
            SettingsItem(
              title: "شارك التطبيق",
            )
          ],
        ),
      ),
    );
  }
}
