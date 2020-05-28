import 'package:flutter/material.dart';
import 'package:iqhome/src/models/qanda.dart';

class QandACard extends StatelessWidget {
  final QandA qandA;

  const QandACard({Key key, @required this.qandA})
      : assert(qandA != null),
        super(key: key);

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
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    qandA.logo,
                    height: 35,
                    width: 35,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      qandA.question,
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
                qandA.shortAnswer,
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
