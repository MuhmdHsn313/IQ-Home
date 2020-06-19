import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iqhome/src/models/concept.dart';
import 'package:url_launcher/url_launcher.dart';

class ConceptCard extends StatelessWidget {
  final Concept concept;

  const ConceptCard({
    Key key,
    @required this.concept,
  })  : assert(concept != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(15),
      elevation: 2.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/concept.svg',
                  height: 35,
                  width: 35,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    concept.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 15),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.5),
              child: Text(
                concept.details,
                overflow: TextOverflow.clip,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Divider(
              color: Theme.of(context).unselectedWidgetColor,
              indent: 25,
              endIndent: 25,
              thickness: 1.25,
            ),
            InkWell(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
              onTap: () async {
                if (await canLaunch(concept.link)) {
                  await launch(concept.link);
                } else {
                  throw 'Could not launch ${concept.link}';
                }
              },
              child: Center(
                child: Text(
                  'المصدر',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
