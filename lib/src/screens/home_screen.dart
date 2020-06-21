import 'package:date_time_format/date_time_format.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../blocs/concept/bloc.dart';
import '../blocs/emergency/bloc.dart';
import '../blocs/media/bloc.dart';
import '../blocs/news/bloc.dart';
import '../blocs/qna/bloc.dart';
import '../blocs/statics/bloc.dart';
import '../blocs/tip/bloc.dart';
import '../utils/iqhome_icons.dart';
import '../widgets/bottom_loader.dart';
import '../widgets/news_card.dart';
import '../widgets/state_card.dart';
import '../widgets/tip_card.dart';
import 'about_covid19_screen.dart';
import 'about_mask.dart';
import 'concept_screen.dart';
import 'emergency_screen.dart';
import 'media_screen.dart';
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
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => SettingsScreen(),
                    fullscreenDialog: true,
                  ),
                );
              }),
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
          bottom: !(currentScreen is _InformationSection)
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
            Positioned.fill(
              child: RefreshIndicator(
                onRefresh: () async {
                  if (currentScreen is _HomeSection)
                    return BlocProvider.of<NewsBloc>(context).add(FetchNews());
                  if (currentScreen is _InformationSection)
                    return BlocProvider.of<TipBloc>(context)
                        .add(FetchTipsEvent());
                  if (currentScreen is _StatisticsSection)
                    return BlocProvider.of<StaticsBloc>(context)
                        .add(FetchLocalStatics());
                },
                child: currentScreen,
              ),
            ),
            Positioned(
              bottom: 30,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  width: MediaQuery.of(context).size.width / 3 + 25,
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
                          color: currentScreen is _StatisticsSection
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).disabledColor,
                        ),
                        onPressed: () => setState(
                          () => currentScreen = _StatisticsSection(),
                        ),
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
            )
          ],
        ),
      ),
    );
  }
}

class _HomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    scrollController.addListener(() => _onScroll(context, scrollController));
    return BlocBuilder<NewsBloc, NewsState>(
      bloc: BlocProvider.of<NewsBloc>(context),
      builder: (context, state) {
        if (state is NewsSuccessfulLoading) {
          final localNews =
              state.news.where((news) => news.type == 'LOCAL').toList()
                ..sort(
                  (c, n) =>
                      n.lastChangedDateTime.compareTo(c.lastChangedDateTime),
                );
          final internationalNews =
              state.news.where((news) => news.type == 'INTERNATIONAL').toList()
                ..sort(
                  (c, n) =>
                      n.lastChangedDateTime.compareTo(c.lastChangedDateTime),
                );

          return TabBarView(
            children: [
              if (localNews.isNotEmpty)
                ListView.separated(
                  itemBuilder: (context, index) => index >= localNews.length
                      ? BottomLoader()
                      : NewsCard(
                          news: localNews[index],
                        ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
                  itemCount: state.hasReachedMax
                      ? localNews.length
                      : localNews.length + 1,
                  padding: EdgeInsets.all(8.0),
                  physics:
                      localNews.length == 1 ? null : BouncingScrollPhysics(),
                  controller: scrollController,
                ),
              if (localNews.isEmpty)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 100,
                    ),
                    Text('لا توجد اخبار محلية!'),
                  ],
                ),
              if (internationalNews.isNotEmpty)
                ListView.separated(
                  itemBuilder: (context, index) =>
                      index >= internationalNews.length
                          ? BottomLoader()
                          : NewsCard(
                              news: internationalNews[index],
                            ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
                  itemCount: state.hasReachedMax
                      ? internationalNews.length
                      : internationalNews.length + 1,
                  padding: EdgeInsets.all(8.0),
                  physics: internationalNews.length == 1
                      ? null
                      : BouncingScrollPhysics(),
                ),
              if (internationalNews.isEmpty)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.language,
                      size: 100,
                    ),
                    Text('لا توجد اخبار عالمية!'),
                  ],
                ),
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

  void _onScroll(BuildContext context, scrollController) {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= 200) {
      BlocProvider.of<NewsBloc>(context).add(LoadMoreNews());
    }
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
              _buildInfoCard(
                context,
                title: 'تصحيح المفاهيم المغلوطة',
                svgPath: 'assets/images/concept.svg',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider<ConceptBloc>(
                      create: (context) => ConceptBloc()..add(FetchConcepts()),
                      child: ConceptScreen(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              _buildInfoCard(
                context,
                title: 'فيدوهات عن مرض كوفيد-19',
                svgPath: 'assets/images/youtube.svg',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider<MediaBloc>(
                      create: (context) => MediaBloc()..add(FetchMedias()),
                      child: MediaScreen(),
                    ),
                  ),
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

class _StatisticsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        _buildIraqStatistics(context),
        _buildWorldStatistics(context),
      ],
    );
  }

  /// Iraq Section
  Widget _buildIraqStatistics(BuildContext context) {
    return BlocBuilder<StaticsBloc, StaticsState>(
      bloc: BlocProvider.of<StaticsBloc>(context),
      builder: (context, state) {
        if (state is StaticsSuccessfulLoaded) {
          return ListView(
            padding: EdgeInsets.all(10.0),
            physics: BouncingScrollPhysics(),
            children: [
              _buildMainCard(context),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 394,
                child: Material(
                  elevation: 2.5,
                  borderRadius: BorderRadius.circular(25),
                  color: Theme.of(context).cardColor,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/iraq_map.svg'),
                              Expanded(
                                child: Text(
                                  'تطور الحالات',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Theme.of(context).cardColor,
                                      ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  '${DateTime.now().day}\n'
                                  '${DateTimeFormat.format(DateTime.now(), format: ' M')}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: LineChart(
                          LineChartData(
                            lineTouchData: LineTouchData(
                              touchTooltipData: LineTouchTooltipData(
                                tooltipBgColor:
                                    Colors.blueGrey.withOpacity(0.8),
                              ),
                              handleBuiltInTouches: true,
                            ),
                            gridData: FlGridData(
                              show: false,
                            ),
                            titlesData: FlTitlesData(
                              leftTitles: SideTitles(
                                showTitles: false,
                              ),
                              bottomTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 30,
                                interval: 1,
                                textStyle: TextStyle(
                                  color: Theme.of(context).errorColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                                getTitles: (value) {
                                  switch (value.toInt()) {
                                    case 1:
                                      return 'Jan';
                                    case 2:
                                      return 'Feb';
                                    case 3:
                                      return 'Mar';
                                    case 4:
                                      return 'Apr';
                                    case 5:
                                      return 'May';
                                    case 6:
                                      return 'Jun';
                                    case 7:
                                      return 'Jul';
                                    case 8:
                                      return 'Aug';
                                    case 9:
                                      return 'Sep';
                                    case 10:
                                      return 'Oct';
                                    case 11:
                                      return 'Nov';
                                    case 12:
                                      return 'DEC';
                                  }
                                  return '';
                                },
                              ),
                            ),
                            borderData: FlBorderData(
                              show: true,
                              border: Border(
                                bottom: BorderSide(
                                  color:
                                      Theme.of(context).unselectedWidgetColor,
                                  width: 1,
                                ),
                                left: BorderSide(
                                  color: Colors.transparent,
                                ),
                                right: BorderSide(
                                  color: Colors.transparent,
                                ),
                                top: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            minX: 2.5,
                            maxX: 12,
                            maxY: 5,
                            minY: 0,
                            lineBarsData: linesBarData1(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              ...List<Widget>.generate(
                state.localStatics.length * 2,
                (index) {
                  if (index % 2 == 0)
                    return StateCard(
                      area: state.localStatics[index - (index ~/ 2)],
                    );
                  return SizedBox(height: 5);
                },
              ),
            ],
          );
        }

        if (state is LoadStaticsField)
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.sentiment_dissatisfied,
                size: 75,
                color: Theme.of(context).disabledColor,
              ),
              Text(
                'خطأ في تحميل البيانات!',
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

  Widget _buildMainCard(BuildContext context) {
    return Container(
      height: 394,
      child: Material(
        elevation: 2.5,
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).cardColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/iraq_map.svg'),
                    Expanded(
                      child: Text(
                        'الاحصائيات الاجمالية',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).cardColor,
                            ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        '${DateTime.now().day}\n'
                        '${DateTimeFormat.format(DateTime.now(), format: ' M')}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStatusCard(
                        title: 'المصابون',
                        color: Theme.of(context).errorColor,
                        number: 24254,
                        context: context,
                        onTap: () {}),
                    _buildStatusCard(
                        title: 'المتعافون',
                        color: Colors.green,
                        number: 10770,
                        context: context,
                        onTap: () {}),
                    _buildStatusCard(
                        title: 'المتوفون',
                        color: Color(0xff434343),
                        number: 773,
                        context: context,
                        onTap: () {}),
                    _buildStatusCard(
                        title: 'المصابون الحاليون',
                        color: Colors.orangeAccent,
                        number: 24254 - 10770,
                        context: context,
                        onTap: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard({
    String title,
    int number,
    Color color,
    BuildContext context,
    VoidCallback onTap,
  }) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          'assets/images/virus-2.svg',
        ),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$number',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  /// World Section
  Widget _buildWorldStatistics(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: Theme.of(context).unselectedWidgetColor,
              borderRadius: BorderRadius.circular(15)),
          child: TextField(
            onChanged: (str) =>
                BlocProvider.of<StaticsBloc>(context).add(Search(str)),
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.search),
              suffixIcon: IconButton(
                tooltip: 'البحث الصوتي',
                onPressed: () {},
                icon: Icon(Icons.mic),
              ),
              hintText: 'البحث',
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<StaticsBloc, StaticsState>(
            bloc: BlocProvider.of<StaticsBloc>(context),
            builder: (context, state) {
              if (state is StaticsSuccessfulLoaded)
                return ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  children: List<Widget>.generate(
                    state.internationalStatics.length * 2,
                    (index) {
                      if (index % 2 == 0)
                        return StateCard(
                          area:
                              state.internationalStatics[index - (index ~/ 2)],
                        );
                      return SizedBox(height: 5);
                    },
                  ),
                );

              if (state is LoadStaticsField)
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sentiment_dissatisfied,
                      size: 75,
                      color: Theme.of(context).disabledColor,
                    ),
                    Text(
                      'خطأ في تحميل البيانات!',
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
      ],
    );
  }

  /// Data
  List<LineChartBarData> linesBarData1(BuildContext context) {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 1.5),
        FlSpot(5, 1.4),
        FlSpot(7, 3.4),
        FlSpot(10, 2),
        FlSpot(12, 2.2),
        FlSpot(13, 1.8),
      ],
      isCurved: true,
      colors: [
        const Color(0xff55AA88),
      ],
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
        getDotPainter: (sop, dnum, data, inum) {
          return FlDotCirclePainter(
            color: Colors.white,
            strokeColor: Theme.of(context).primaryColor,
            strokeWidth: 2,
          );
        },
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 2.8),
        FlSpot(7, 1.2),
        FlSpot(10, 2.8),
        FlSpot(12, 2.6),
        FlSpot(13, 3.9),
      ],
      isCurved: true,
      colors: [
        const Color(0xffEE3030),
      ],
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
        getDotPainter: (sop, dnum, data, inum) {
          return FlDotCirclePainter(
            color: Colors.white,
            strokeColor: Colors.black,
            strokeWidth: 2,
          );
        },
      ),
      belowBarData: BarAreaData(show: false, colors: [
        const Color(0x00aa4cfc),
      ]),
    );
    final LineChartBarData lineChartBarData3 = LineChartBarData(
      spots: [
        FlSpot(1, 2.8),
        FlSpot(3, 1.9),
        FlSpot(6, 3),
        FlSpot(10, 1.3),
        FlSpot(13, 2.5),
      ],
      isCurved: true,
      colors: const [
        Color(0xff434343),
      ],
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
        getDotPainter: (sop, dnum, data, inum) {
          return FlDotCirclePainter(
            color: Colors.white,
            strokeColor: Colors.black,
            strokeWidth: 2,
          );
        },
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );

    return [
      lineChartBarData1,
      lineChartBarData2,
      lineChartBarData3,
    ];
  }
}
