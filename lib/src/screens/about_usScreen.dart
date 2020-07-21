import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("من نحن"),
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            height: 179,
            color: Theme.of(context).cardColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "مبادرة",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "البرمجة للعراق"
                        "\nCode for iraq",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 23),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: SvgPicture.asset(
                    'assets/images/cfi_logo.svg',
                    height: 105,
                    width: 105,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              "عن المبادرة",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              """ وهي مبادرة إنسانية غير ربحية تهدف الى خدمة المجتمع عن طريق البرمجة تعتبر هذه المبادرة مبادرة تعليمية حقيقية ترعى المهتمين بتعلم تصميم وبرمجة تطبيقات الهاتف الجوال ومواقع الانترنت وبرامج الحاسوب والشبكات والاتصالات ونظم تشغيل الحاسوب باستخدام التقنيات مفتوحة المصدر كما توفر لهم جميع الدروس التعليمية اللازمة وبشكل مجاني تماما بل الأهم من ذلك تعتمد على مبدأ المواطنة والمشاركة الفاعل""",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              "تدعوا المبادرة",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              """في تأسيس وبناء المجتمع تدعو هذه المبادرة جميع الطلبة والخريجين والهواة والاساتذة الجامعيين والمهتمين في مجال البرمجة وتقنيات المعلومات وكذلك الاختصاصات الأخرى للتطوع والمشاركة الفعلية لأجل الارتقاء بواقع البلد حيث تعتبر فرصة عظيمة لأكتساب الخبرة والمهارة عن طريق تصميم وتنفيذ برامج وتطبيقات خدمية من شأنها خدمة المواطن وذلك ضمن مجاميع عمل نشطة وفعالة يتعاون فيها جميع الأفراد كفريق واحد لتبادل الآراء والخبرات ويطرح الأفكار ليتم مناقشتها وتطبيقها على أرض الواقع كما تفتح المجال لجميع المواطنين العراقيين ومن جميع الاختصاصات الى المشاركة الفاعلة في هذه المشاريع لرفد الفريق بالخبرات والأفكار والآراء والمقترحات التي من شأنها خدمة المجتمع بأفضل ما يمكن""",
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
