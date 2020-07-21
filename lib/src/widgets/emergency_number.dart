import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/emergency.dart';
import '../utils/app_theme.dart';
import '../utils/iqhome_icons.dart';

class EmergencyNumber extends StatelessWidget {
  final Emergency emergency;

  const EmergencyNumber({Key key, @required this.emergency})
      : assert(emergency != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: ListTile(
        title: Text(
          emergency.name,
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: Theme.of(context).errorColor,
              ),
        ),
        trailing: Container(
          width: 75,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 1,
                child: IconButton(
                  tooltip: 'إضافة الى جهات الاتصال',
                  icon: Icon(
                    Icons.call,
                    color: Theme.of(context).errorColor,
                  ),
                  onPressed: () async {
                    final url = 'tel:${emergency.contact}';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 1),
               child:  Text(
                    emergency.contact,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: AppTheme.textColor2),
                  ),
              
              ),
            ],
          ),
        ),
      ),
    );
  }
}
