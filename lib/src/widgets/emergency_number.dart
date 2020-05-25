import 'package:flutter/material.dart';
import 'package:iqhome/src/utils/app_theme.dart';
import 'package:iqhome/src/utils/iqhome_icons.dart';

class EmergencyNumber extends StatelessWidget {
  /// TODO: Add model object and view its data in this class.

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: ListTile(
        title: Text(
          'الامن الوطني - الجرائم الالكترونية',
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: Theme.of(context).errorColor,
              ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                IQHomeIcons.arrow_down_circle,
                color: Theme.of(context).errorColor,
              ),
              onPressed: () {},
            ),
            Text(
              '533',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: AppTheme.textColor2),
            ),
          ],
        ),
      ),
    );
  }
}
