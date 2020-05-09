import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String title;

  const SettingsItem({
    @required this.title,
  }) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: ListTile(
        onTap: () {},
        title: Text(title),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Color(0xffC7C7CC),
          size: 18,
        ),
      ),
    );
  }
}
