import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iqhome/src/blocs/emergency/bloc.dart';
import 'package:iqhome/src/blocs/news/bloc.dart';
import 'package:iqhome/src/blocs/qna/bloc.dart';
import 'package:iqhome/src/blocs/tip/bloc.dart';
import 'package:iqhome/src/models/news.dart';
import 'package:iqhome/src/screens/about_covid19_screen.dart';
import 'package:iqhome/src/screens/emergency_screen.dart';
import 'package:iqhome/src/utils/iqhome_icons.dart';
import 'package:iqhome/src/widgets/news_card.dart';
import 'package:iqhome/src/widgets/tip_card.dart';

import 'about_mask.dart';
import 'qanda_screen.dart';
import 'settingsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget currentScreen;

  @override
  void initState() {
    super.initState();
    currentScreen = _HomeSection();
  }

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
                  builder: (context) => BlocProvider<EmergencyBloc>(
                    create: (context) => EmergencyBloc()..add(FetchEmergency()),
                    child: EmergencyScreen(),
                  ),
                ),
              ),
            ),
          ],
          bottom: currentScreen is _HomeSection
              ? PreferredSize(
                  preferredSize: Size.fromHeight(56),
                  child: Container(
                    color: Theme.of(context).backgroundColor,
                    child: TabBar(
                      unselectedLabelColor:
                          Theme.of(context).unselectedWidgetColor,
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
                )
              : null,
        ),
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: currentScreen,
            ),
            Positioned(
              bottom: 30,
              left: 122,
              right: 122,
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
                        color: currentScreen is _HomeSection
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                      ),
                      onPressed: () => setState(
                        () => currentScreen = _HomeSection(),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        IQHomeIcons.information,
                        color: currentScreen is _InformationSection
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                      ),
                      onPressed: () => setState(
                        () => currentScreen = _InformationSection(),
                      ),
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

class _HomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      bloc: BlocProvider.of<NewsBloc>(context),
      builder: (context, state) {
        if (state is NewsSuccessfulLoading) {
          List<News> localNews =
              state.news.where((news) => news.type == 'LOCAL').toList()
                ..sort(
                  (c, n) =>
                      n.lastChangedDateTime.compareTo(c.lastChangedDateTime),
                );
          List<News> internationalNews =
              state.news.where((news) => news.type == 'INTERNATIONAL').toList()
                ..sort(
                  (c, n) =>
                      n.lastChangedDateTime.compareTo(c.lastChangedDateTime),
                );

          return TabBarView(
            children: [
              ListView.separated(
                itemBuilder: (context, index) => NewsCard(
                  news: localNews[index],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                itemCount: localNews.length,
                padding: EdgeInsets.all(8.0),
                physics: localNews.length == 1 ? null : BouncingScrollPhysics(),
              ),
              ListView.separated(
                itemBuilder: (context, index) => NewsCard(
                  news: internationalNews[index],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                itemCount: internationalNews.length,
                padding: EdgeInsets.all(8.0),
                physics: internationalNews.length == 1
                    ? null
                    : BouncingScrollPhysics(),
              )
            ],
          );
        }

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
    );
  }
}

class _InformationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TipBloc, TipState>(
      bloc: BlocProvider.of<TipBloc>(context),
      builder: (context, state) {
        if (state is TipLoadedState)
          return ListView(
            physics: state.tips.length == 1 ? null : BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                height: 226,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/who-cover.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              _buildInfoCard(
                context,
                title: 'عن مرض كوفيد - 19',
                svgPath: 'assets/images/virus.svg',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutCovid19Screen(),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              _buildInfoCard(
                context,
                title: 'سؤال وجواب',
                svgPath: 'assets/images/q&a.svg',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider<QnABloc>(
                      create: (context) => QnABloc()
                        ..add(
                          FetchQnAEvent(),
                        ),
                      child: QandAScreen(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              _buildInfoCard(
                context,
                title: 'معلومات عن الكمامة',
                svgPath: 'assets/images/security.svg',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutMask()),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ...List.generate(
                state.tips.length * 2,
                (index) {
                  if (index % 2 == 0)
                    return TipCard(
                      tip: state.tips[index - (index ~/ 2)],
                    );
                  return SizedBox(height: 15);
                },
              ),
            ],
          );

        if (state is TipErrorState)
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.sentiment_dissatisfied,
                size: 75,
                color: Theme.of(context).disabledColor,
              ),
              Text(
                'Error: ${state.message}',
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
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    @required String title,
    @required String svgPath,
    VoidCallback onTap,
  }) {
    return Container(
      height: 185,
      width: 380,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 10,
            offset: Offset(0, 0),
          )
        ],
        borderRadius: BorderRadius.circular(25),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  color: Theme.of(context).highlightColor,
                ),
                child: Hero(
                  tag: svgPath,
                  child: SvgPicture.asset(
                    svgPath,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Hero(
                  tag: title,
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
