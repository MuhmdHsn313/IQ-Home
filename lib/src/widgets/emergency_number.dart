import 'package:flutter/material.dart';
import 'package:iqhome/src/utils/app_theme.dart';

class EmergencyNumber extends StatelessWidget {
  /// TODO: Add model object and view its data in this class.

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: ListTile(
        title: Text(
          'الامن الوطني - الجرائم الالكترونية',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '533',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: AppTheme.textColor2),
            ),
            IconButton(
              icon: Icon(
                Icons.play_for_work,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
