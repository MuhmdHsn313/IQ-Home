import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:iqhome/src/blocs/news/bloc.dart';
import 'package:iqhome/src/screens/home_screen.dart';
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
        GlobalMaterialLocalizations.delegate,
      ],
      locale: Locale('ar'),
      supportedLocales: [
        Locale('ar'),
        Locale('en'),
      ],
      home: BlocProvider<NewsBloc>(
        create: (context) => NewsBloc()..add(FetchNews()),
        child: HomeScreen(),
      ),
    );
  }
}
