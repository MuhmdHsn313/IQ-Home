import 'package:flutter/material.dart';

class QandACard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 5,
            color: Theme.of(context).unselectedWidgetColor,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 7,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 8.0,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/who-logo.png',
                    height: 35,
                    width: 35,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Text(
                      'ما هي توصيات منظمة الصحة العالمية للمسافرين للخارج؟',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.5),
              child: Text(
                """نشرت المنظمة نصائح بشأن السفر في 10 كانون الثاني/يناير. وبناءً على المعلومات المتوفرة حاليًا، لا يوجد بعد ما يبرر فرض أي قيود على السفر أو التجارة. (لا يعد تحرِّي المسافرين بشكل عام قيدًا مفروضًا على السفر). وفي حال تصاعد الوضع، ستوفر منظمة الصحة العالمية إرشادات بشأن مخاطر السفر إلى المناطق الموبوءة. ويجب على المسافرين الاطلاع على التوصيات الحالية للسفر. ففي ذروة وباء عام 2003، كان خطر انتقال فيروس كورونا المسبب لمتلازمة الالتهاب الرئوي الحاد الوخيم (سارس) على المسافرين منخفضًا بشكل إجمالي. كما لم يتم فرض أي قيود على السفر أو التجارة عند ظهور فيروس كورونا المسبب لمتلازمة الشرق الأوسط التنفسية.
وتُوصي المنظمة أنه يجب على الأشخاص القادمين من مدينة ووهان أو المناطق الأخرى التي تشهد خطرًا شديدًا معرفة الأعراض الرئيسية التي أوضحتها السلطات الصحية، كما يجب عليهم طلب المشورة الطبية من أحد الممارسين الصحيين إذا أُصيبوا بأعراض بعد مغادرتهم لمنطقة الفاشية. ويُنصح المسافرون بالتواصل مع أطبائهم أو السلطات الصحية الوطنية لديهم للحصول على معلومات إضافية، حيث قد تقوم بعض البلدان بتكييف توصيات المنظمة لإدراج اعتبارات وطنية.""",
                maxLines: 3,
                overflow: TextOverflow.clip,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).unselectedWidgetColor,
            indent: 25,
            endIndent: 25,
            thickness: 1.25,
          ),
          Expanded(
            flex: 5,
            child: InkWell(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
              onTap: () {
                print('fff');
              },
              child: Center(
                child: Text(
                  'متابعة القراءة',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
