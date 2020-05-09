import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsCheckBox extends StatefulWidget {
  final String title;

  SettingsCheckBox(this.title);

  @override
  _SettingsCheckBoxState createState() => _SettingsCheckBoxState();
}

class _SettingsCheckBoxState extends State<SettingsCheckBox> {
  bool value;

  @override
  void initState() {
    value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: Theme.of(context).cardColor,
      child: ListTile(
        onTap: () {},
        title: Text(widget.title),
        trailing: CupertinoSwitch(
          value: value,
          onChanged: (change) {
            setState(() {
              value = change;
            });
          },
        ),
      ),
    );
  }
}
