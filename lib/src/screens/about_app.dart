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
          DataTable(
            columns: [
              DataColumn(
                label: Text(
                  'الدور',
                  style: TextStyle(fontFamily: 'Tajawal'),
                ),
              ),
              DataColumn(
                label: Text(
                  'الاسم',
                  style: TextStyle(fontFamily: 'Tajawal'),
                ),
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text(
                    'مدير مشروع',
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                    ),
                  )),
                  DataCell(Text(
                    'محمد منتظر جلال حسين',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'فريق جمع المعلومات',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                  DataCell(Text(
                    'تبارك علاء صالح',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'فريق جمع المعلومات',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                  DataCell(Text(
                    'علي عبد الرضا محمود',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'فريق جمع المعلومات',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                  DataCell(Text(
                    'آلاء فخري مطر',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'فريق جمع المعلومات',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                  DataCell(Text(
                    'سحر عدنان عزيز',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'خطة العمل',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                  DataCell(Text(
                    'شهد صالح متعب',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'خوارزميات',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                  DataCell(Text(
                    'علياء ايوب هادي',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'مصمم الواجهات',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                  DataCell(Text(
                    'محمد توفيق ناجي',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'لوحة التحكم',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                  DataCell(Text(
                    'محمد علي سالم علي',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'مطور الباك اند',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                  DataCell(Text(
                    'علي عبد حبيب',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'مبرمج الموبايل',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                  DataCell(Text(
                    'محمد حسن عدي حسن',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'مبرمج الموبايل',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                  DataCell(Text(
                    'فهد محفوظ محمد',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'احصائيات',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                  DataCell(Text(
                    'علي جاسم محمد',
                    style: TextStyle(fontFamily: 'Tajawal'),
                  )),
                ],
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 19, right: 19, bottom: 20),
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
