import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocs/news/bloc.dart';
import 'blocs/tip/bloc.dart';
import 'screens/home_screen.dart';
import 'utils/app_theme.dart';

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NewsBloc>(
            create: (context) => NewsBloc()..add(FetchNews()),
          ),
          BlocProvider<TipBloc>(
            create: (context) => TipBloc()..add(FetchTipsEvent()),
          ),
        ],
        child: HomeScreen(),
      ),
    );
  }
}
