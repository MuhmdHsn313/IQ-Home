import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iqhome/src/utils/app_theme.dart';
import 'package:iqhome/src/utils/iqhome_icons.dart';
import 'package:iqhome/src/widgets/news_card.dart';

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
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(
                IQHomeIcons.emergency_numbers,
                size: 30,
                color: Colors.white,
              ),
              tooltip: 'أرقام الطوارئ',
              onPressed: () {},
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
                    text: 'العالم',
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
              child: ListView.separated(
                itemBuilder: (context, index) => NewsCard(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 5,
                ),
                itemCount: 5,
                padding: EdgeInsets.all(8.0),
                physics: BouncingScrollPhysics(),
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
