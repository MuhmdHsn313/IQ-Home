import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class NotesAboutMaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).cardColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).disabledColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Expanded(
              child: Hero(
                tag: 'ملاحظات عن الكمامة',
                child: Text(
                  'ملاحظات عن الكمامة',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            Hero(
              tag: 'assets/images/security.svg',
              child: SvgPicture.asset(
                'assets/images/security.svg',
                width: 30,
                height: 30,
                color: Theme.of(context).unselectedWidgetColor,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top:20.0,right: 20.0,left: 20.0),
        children: [
          Text(
            'إذا قررت أن ترتدي كمامة فاتبع الإرشادات التالية:',
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: Theme.of(context).disabledColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 10,
          ),
          Linkify(
            text:
                """1- قبل لمس الكمامة، نظف يديك بفركهما بمطهر كحولي أو بغسلهما بالماء والصابون.

2- تفقد الكمامة وتأكد من خلوها من الشقوق والثقوب.

3- حدد الطرف العلوي من الكمامة (موضع الشريط المعدني).

4- تأكد من توجيه الجهة الصحيحة من الكمامة إلى الخارج (الجهة الملونة).

5- ضع الكمامة على وجهك. اضغط على الشريط المعدني أو الطرف المقوى للكمامة ليتخذ شكل أنفك.

6- اسحب الجزء السفلي من الكمامة لتغطي فمك وذقنك.

7-  لا تلمس الكمامة ما دمت ترتديها للحماية.

8- بعد الاستخدام، اخلع الكمامة بنزع الشريط المطاطي من خلف الأذنين مع الحرص على إبعادها عن وجهك وملابسك لتجنب ملامسة أجزاء الكمامة التي يحتمل أن تكون ملوثة.

9- تخلص من الكمامة المستعملة على الفور برميها في سلة مهملات مغلقة. لا تستخدم الكمامة المستعملة مرة أخرى.

10- نظف يديك بعد ملامسة الكمامة أو رميها، إما بفركهما بمطهر كحولي أو بغسلهما بالماء والصابون إذا كانتا متسختين بوضوح.

ضع في اعتبارك أن هناك نقص عالمي في الكمامات الطبية (الجراحية والكمامات من نوع N95). لذلك ينبغي الاحتفاظ بهذه الكمامات لاستخدام العاملين في مجال الرعاية الصحية حصراً، قدر الإمكان.

وتذكّر أن استخدام الكمامة ليس بديلاً عن الطرق الأخرى الأكثر فعالية لحماية نفسك والآخرين من عدوى كوفيد-19، مثل المواظبة على غسل اليدين وتغطية الفم والأنف بثني المرفق أو بمنديل ورقي عند السعال، والحفاظ على مسافة متر واحد (3 أقدام) على الأقل بينك وبين الآخرين. انظر تدابير الحماية الأساسية من فيروس كورونا الجديد للحصول على مزيد من المعلومات بهذا الشأن.""",
            onOpen: (link) async {
              if (await canLaunch(link.url)) {
                await launch(link.url);
              } else {
                throw 'Could not launch ${link.url}';
              }
            },
            style: Theme.of(context).textTheme.subtitle2,
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  'اتبع النصائح الصادرة عن السلطات الصحية الوطنية بشأن استخدام الكمامات.',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              Expanded(
                flex: 2,
                child: Opacity(
                  opacity: 0.3,
                  child: SvgPicture.asset(
                    'assets/images/avatar.svg',
                    height: 140,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
