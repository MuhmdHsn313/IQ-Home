import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("عن التطبيق"),
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            height: 180,
            color: Theme.of(context).cardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/images/iq_home.svg',
                  height: 105,
                  width: 105,
                ),
                Text(
                  "IQ-Home",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 23),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              """تم انشاء هذا التطبيق لغرض توعية الناس عن كوفيد 19  مرض فيروس (كورونا المستجد) ولغرض الاجابة عن كل الاسئلة التي تدور في ذهن اي شخص حول المرض.
 وايضاً لمعرفة الاحصائيات الخاصة بالاصابات والشفاء والوفيات اول بأول في العراق والعالم وكافة الاخبار الموثوقة التي تخص المرض من قبل وزارة الصحة العراقية ومنظمة الصحة العالمية """,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 1, left: 19, right: 19, bottom: 20),
            child: Image.asset(
              "assets/images/codeforiraq2.png",
              width: 351.08,
            ),
          )
        ],
      ),
    );
  }
}
