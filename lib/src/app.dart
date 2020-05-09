import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:iqhome/src/utils/app_theme.dart';

class IQHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IQ Home',
      theme: AppTheme.lightTheme,
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: Locale('ar'),
      supportedLocales: [
        Locale('ar'),
      ],
      home: Scaffold(),
    );
  }
}
