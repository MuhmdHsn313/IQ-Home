import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqhome/src/blocs/app_settings/app_settings_bloc.dart';
import 'package:iqhome/src/blocs/app_settings/bloc.dart';
import 'package:iqhome/src/screens/about_app.dart';
import 'package:iqhome/src/screens/about_usScreen.dart';
import 'package:iqhome/src/widgets/fontSize.dart';
import 'package:iqhome/src/widgets/rate.dart';
import 'package:iqhome/src/widgets/seetingsItem.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "الأعدادات",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 27, top: 14, right: 18, left: 18),
              child: Rate(),
            ),
            FontSizeWidget(),
            BlocBuilder<AppSettingsBloc, AppSettingsState>(
              bloc: BlocProvider.of<AppSettingsBloc>(context),
              builder: (context, state) => Container(
                height: 48,
                color: Theme.of(context).cardColor,
                child: ListTile(
                  title:
                      Text(state.isDarkMode ? "الوضع النهاري" : "الوضع المظلم"),
                  trailing: CupertinoSwitch(
                    value: state.isDarkMode,
                    onChanged: (change) =>
                        BlocProvider.of<AppSettingsBloc>(context)
                            .add(ChangeThemeMode(change)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 13.5,
            ),
            BlocBuilder<AppSettingsBloc, AppSettingsState>(
              bloc: BlocProvider.of<AppSettingsBloc>(context),
              builder: (context, state) => Container(
                height: 48,
                color: Theme.of(context).cardColor,
                child: ListTile(
                  title: Text("الأشعارات"),
                  trailing: CupertinoSwitch(
                    value: state.isNotificationEnable,
                    onChanged: (change) =>
                        BlocProvider.of<AppSettingsBloc>(context)
                            .add(ChangeNotificationState(change)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            SettingsItem(
              title: "مصادرنا (المواقع الرسمية)",
            ),
            SizedBox(
              height: 8,
            ),
            SettingsItem(
              title: "عن التطبيق",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutAppScreen(),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SettingsItem(
              title: "من نحن",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUsScreen(),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SettingsItem(
              title: "شارك التطبيق",
            )
          ],
        ),
      ),
    );
  }
}
