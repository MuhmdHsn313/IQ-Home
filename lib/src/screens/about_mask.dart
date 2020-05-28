import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iqhome/src/screens/notes_about_mask_screen.dart';
import 'package:iqhome/src/widgets/details_appbar.dart';

class AboutMask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            DetailsAppBar(
              title: 'متى ينبغي استخدام الكمامة؟',
              svgPath: 'assets/images/security.svg',
              imgPath: 'assets/images/avatar.svg',
              subtitle:
                  'العديد من الأسئلة حول الكمامة مما يوفر لك مصدر حماية لك وللمجتمع.' +
                      '\n' +
                      '\n' +
                      'كيفية ارتداء الكمامة والطريقة الصحيحة لارتدائها واستخدامها ونزعها والتخلص منها',
              screenName: 'معلومات حول الكمامة',
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 2.5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ListTile(
                title: Text('ملاحظات عن الكمامة'),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotesAboutMaskScreen(),
                    ),
                  ),
                ),
              ),
            ),
            ...List<Container>.generate(
              7,
              (index) => Container(
                height: 375,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage('assets/images/mask-${index + 1}.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
