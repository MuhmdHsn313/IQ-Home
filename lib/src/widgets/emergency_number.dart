import 'package:flutter/material.dart';
import 'package:iqhome/src/models/emergency.dart';
import 'package:iqhome/src/utils/app_theme.dart';
import 'package:iqhome/src/utils/iqhome_icons.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    IQHomeIcons.arrow_down_circle,
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
              Expanded(
                flex: 1,
                child: Text(
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
