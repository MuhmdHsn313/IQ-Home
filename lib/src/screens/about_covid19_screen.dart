import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutCovid19Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).cardColor,
        iconTheme: IconThemeData(
          color: Theme.of(context).disabledColor,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: 200,
            color: Theme.of(context).cardColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'assets/images/virus.svg',
                  child: SvgPicture.asset(
                    'assets/images/virus.svg',
                    width: 135,
                    height: 135,
                    color: Theme.of(context).unselectedWidgetColor,
                  ),
                ),
                SizedBox(height: 10,),
                Hero(
                  tag: 'عن مرض كوفيد - 19',
                  child: Text(
                    'عن مرض كوفيد - 19',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Linkify(
              text:
                  """تعد فيروسات كورونا فصيلة كبيرة من الفيروسات التي تسبب اعتلالات تتنوع بين الزكام وأمراض أكثر وخامة، مثل متلازمة الشرق الأوسط التنفسية (MERS-CoV)، ومتلازمة الالتهاب الرئوي الحاد الوخيم (سارس) (SARS-CoV). ويُمثِّل فيروس كورونا المستجد (nCoV) سلالة جديدة لم يسبق تحديدها لدى البشر من قبل.

وتعد فيروسات كورونا حَيَوانِيّة المَصْدَر، ويعني ذلك أنها تنتقل بين الحيوانات والبشر. وتوصَّلت الاستقصاءات المستفيضة إلى أنَّ فيروس كورونا المسبب لمتلازمة الالتهاب الرئوي الحاد الوخيم (سارس) قد انتقل من سَنَانير الزبَّاد إلى البشر، بينما انتقل فيروس كورونا المسبب لمتلازمة الشرق الأوسط التنفسية من الجمال الوحيدة السنام إلى البشر. وينتشر العديد من فيروسات كورونا المعروفة بين الحيوانات، ولم تُصيب البشر بعد.

وتشمل الأعراض الشائعة للعدوى أعراضًا تنفسية والحمى والسعال وضيق النفس وصعوبات في التنفس. وفي الحالات الأكثر وخامة، قد تسبب العدوى الالتهاب الرئوي، ومتلازمة الالتهاب الرئوي الحاد الوخيم، والفَشَل الكُلَويّ، وحتى الوفاة.

وتشمل التوصيات الموحدة للوقاية من انتشار العدوى: غسل اليدين بانتظام، وتغطية الفم والأنف عند السعال والعطس، وطهي اللحوم والبيض جيدًا. بالإضافة إلى تجنب مخالطة أي شخص تبدو عليه أعراض الإصابة بمرض تنفسي، مثل السعال والعطس.""",
              onOpen: (link) async {
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                } else {
                  throw 'Could not launch ${link.url}';
                }
              },
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    color: Theme.of(context).disabledColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
