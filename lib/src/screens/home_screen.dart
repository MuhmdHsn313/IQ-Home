import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iqhome/src/blocs/news/bloc.dart';
import 'package:iqhome/src/screens/emergency_screen.dart';
import 'package:iqhome/src/utils/iqhome_icons.dart';
import 'package:iqhome/src/widgets/news_card.dart';

import 'settingsScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('الرئيسية'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.more_horiz,
              size: 35,
              color: Colors.white,
            ),
            tooltip: 'الاعدادات',
            onPressed: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => SettingsScreen(),
                fullscreenDialog: true,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                IQHomeIcons.emergency_numbers,
                size: 30,
                color: Colors.white,
              ),
              tooltip: 'أرقام الطوارئ',
              onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => EmergencyScreen(),
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: Container(
              color: Theme.of(context).backgroundColor,
              child: TabBar(
                unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
                tabs: [
                  Tab(
                    text: 'العراق',
                  ),
                  Tab(
                    text: 'عالمياً',
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: BlocBuilder<NewsBloc, NewsState>(
                bloc: BlocProvider.of<NewsBloc>(context),
                builder: (context, state) {
                  if (state is NewsSuccessfulLoading)
                    return ListView.separated(
                      itemBuilder: (context, index) => NewsCard(
                        news: state.news[index],
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 15,
                      ),
                      itemCount: state.news.length,
                      padding: EdgeInsets.all(8.0),
                      physics: BouncingScrollPhysics(),
                    );

                  if (state is NewsLoadingError)
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sentiment_dissatisfied,
                          size: 75,
                          color: Theme.of(context).disabledColor,
                        ),
                        Text(
                          'Error: ${state.error}',
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                                color: Theme.of(context).disabledColor,
                              ),
                        ),
                      ],
                    );

                  return SpinKitCircle(
                    color: Theme.of(context).primaryColor,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 30,
              left: 125,
              right: 125,
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).disabledColor,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        IQHomeIcons.statistics,
                        color: Theme.of(context).disabledColor,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        IQHomeIcons.home,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        IQHomeIcons.information,
                        color: Theme.of(context).disabledColor,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
