import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:iqhome/src/screens/news_screen.dart';

import 'blocs/notification/notification_bloc.dart';
import 'blocs/app_settings/bloc.dart';
import 'blocs/news/bloc.dart';
import 'blocs/statics/bloc.dart';
import 'blocs/tip/bloc.dart';
import 'models/news.dart';
import 'screens/home_screen.dart';
import 'utils/app_theme.dart';

class IQHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsBloc, AppSettingsState>(
      bloc: BlocProvider.of<AppSettingsBloc>(context),
      builder: (context, state) {
        return MaterialApp(
          title: 'IQ Home',
          theme: AppTheme.lightTheme(state.fontScale),
          darkTheme: AppTheme.dark(state.fontScale),
          themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
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
          home: BlocListener<NotificationBloc, NotificationState>(
            bloc: BlocProvider.of<NotificationBloc>(context),
            listener: (context, state) {
              if (state is OnReceiveNotification) {
                show(context, state.news);
              }
            },
            child: MultiBlocProvider(
              providers: [
                BlocProvider<NewsBloc>(
                  create: (context) => NewsBloc()..add(FetchNews()),
                ),
                BlocProvider<TipBloc>(
                  create: (context) => TipBloc()..add(FetchTipsEvent()),
                ),
                BlocProvider<StaticsBloc>(
                  create: (context) => StaticsBloc()..add(FetchLocalStatics()),
                ),
              ],
              child: HomeScreen(),
            ),
          ),
        );
      },
    );
  }

  void show(BuildContext context, News news) {
    AchievementView(
      context,
      title: news.title,
      subTitle: news.subtitle,
      isCircle: false,
      icon: Icon(
        Icons.description,
        color: Theme.of(context).accentColor,
      ),
      color: Theme.of(context).primaryColor,
      onTab: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewsScreen(news: news),
        ),
      ),
    )..show();
  }
}
