import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:iqhome/src/models/qanda.dart';
import 'package:url_launcher/url_launcher.dart';

class QandADetailsScreen extends StatelessWidget {
  final QandA qandA;

  const QandADetailsScreen({
    Key key,
    @required this.qandA,
  })  : assert(qandA != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).disabledColor,
        ),
        backgroundColor: Theme.of(context).cardColor,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: 200,
            color: Theme.of(context).cardColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: '${qandA.id}-qna-image',
                  child: Image(
                    width: 135,
                    height: 135,
                    image: CachedNetworkImageProvider(qandA.logo),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Hero(
                  tag: '${qandA.id}-qna-question',
                  child: Text(
                    qandA.question,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Hero(
              tag: '${qandA.id}-qna-answer',
              child: SelectableLinkify(
                text: qandA.answer,
                onOpen: (link) async {
                  if (await canLaunch(link.url)) {
                    await launch(link.url);
                  } else {
                    throw 'Could not launch ${link.url}';
                  }
                },
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: Theme.of(context).disabledColor,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
