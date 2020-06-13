import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/news/bloc.dart';
import '../models/news.dart';
import '../screens/news_screen.dart';
import '../utils/string_time_generator.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({
    Key key,
    @required this.news,
  })  : assert(news != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 394,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 5,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<NewsBloc>(context).add(
            SeenNewNews(news),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsScreen(
                news: news,
              ),
            ),
          );
        },
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: '${news.id}-source',
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage: CachedNetworkImageProvider(
                              news.source.logo,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                news.source.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(fontSize: 11),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                margin: EdgeInsets.all(2.5),
                                decoration: news.seen
                                    ? null
                                    : BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                              ),
                              Text(
                                StringTimeGenerator.get(
                                    news.lastChangedDateTime),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontSize: 11),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Hero(
                      tag: '${news.id}-title',
                      child: Text(
                        news.title,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 15),
                      ),
                    ),
                    Hero(
                      tag: '${news.id}-body',
                      child: Text(
                        news.body,
                        maxLines: 3,
                        overflow: TextOverflow.clip,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Hero(
                tag: news.cover + news.id.toString(),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(25),
                    ),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(news.cover),
                      fit: BoxFit.cover,
                    ),
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
