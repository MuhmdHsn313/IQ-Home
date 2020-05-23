import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iqhome/src/models/news.dart';
import 'package:iqhome/src/models/section.dart';
import 'package:iqhome/src/utils/app_theme.dart';
import 'package:iqhome/src/utils/string_time_generator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsScreen extends StatelessWidget {
  final News news;

  const NewsScreen({
    Key key,
    @required this.news,
  })  : assert(news != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Theme.of(context).primaryColor),
    );
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: Hero(
            tag: news.id,
            child: Container(
              height: 110,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: CachedNetworkImageProvider(
                          news.source.logo,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            news.source.name,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(fontSize: 11),
                          ),
                        ),
                      ),
                      Text(
                        StringTimeGenerator.get(news.lastChangedDateTime),
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 11),
                      ),
                    ],
                  ),
                  Text(
                    news.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(150),
      ),
      body: ListView(
        children: [
          Hero(
            tag: news.cover + news.id.toString(),
            child: CachedNetworkImage(
              imageUrl: news.cover,
              fit: BoxFit.cover,
              height: 240,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              news.body,
              overflow: TextOverflow.clip,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: AppTheme.disabledColor,
                  ),
            ),
          ),
          ...List<Widget>.generate(
            news.sections.length,
            (index) => _generateSection(context, news.sections[index]),
          ),
        ],
      ),
    );
  }

  Widget _generateSection(BuildContext context, Section section) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          section.cover,
          fit: BoxFit.cover,
          height: 240,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            section.body,
            overflow: TextOverflow.clip,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: AppTheme.disabledColor,
                ),
          ),
        ),
      ],
    );
  }
}
