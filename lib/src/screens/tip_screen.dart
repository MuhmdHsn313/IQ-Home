import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:iqhome/src/models/tip.dart';
import 'package:url_launcher/url_launcher.dart';

class TipScreen extends StatelessWidget {
  final Tip tip;

  const TipScreen({
    Key key,
    @required this.tip,
  })  : assert(tip != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).cardColor,
        iconTheme: IconThemeData(
          color: Theme.of(context).disabledColor,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
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
                  tag: '${tip.id}-tip-image',
                  child: Image(
                    image: CachedNetworkImageProvider(tip.cover),
                    width: 135,
                    height: 135,
                    color: Theme.of(context).unselectedWidgetColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Hero(
                  tag: '${tip.id}-tip-title',
                  child: Text(
                    tip.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: SelectableLinkify(
              text: tip.details,
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
          SizedBox(
            height: 10,
          ),
          if (tip.links.isNotEmpty)
            Container(
              color: Theme.of(context).cardColor,
              child: ListTile(
                title: Text('مواقع ذات صلة'),
              ),
            ),
          if (tip.links.isNotEmpty)
            SizedBox(
              height: 10,
            ),
          if (tip.links.isNotEmpty)
            ...List<Widget>.generate(
              tip.links.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      final url = tip.links[index]['url'];
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text(
                      tip.links[index]['title'],
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
