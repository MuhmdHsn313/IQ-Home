import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iqhome/src/models/source.dart';
import 'package:iqhome/src/utils/iqhome_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class SourceCard extends StatelessWidget {
  final Source source;

  const SourceCard({
    Key key,
    @required this.source,
  })  : assert(source != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: CachedNetworkImageProvider(
                    source.logo,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      source.name,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontSize: 11),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    IQHomeIcons.global,
                    color: source.webUrl != null && source.webUrl != 'string'
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                  ),
                  onPressed: () => openUrl(source.webUrl),
                ),
                IconButton(
                  icon: Icon(
                    IQHomeIcons.telegram,
                    color: source.telegramUrl != null &&
                            source.telegramUrl != 'string'
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                  ),
                  onPressed: () => openUrl(source.telegramUrl),
                ),
                IconButton(
                  icon: Icon(
                    IQHomeIcons.twitter,
                    color: source.twitterUrl != null &&
                            source.twitterUrl != 'string'
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                  ),
                  onPressed: () => openUrl(source.twitterUrl),
                ),
                IconButton(
                  icon: Icon(
                    IQHomeIcons.facebook,
                    color: source.facebookUrl != null &&
                            source.facebookUrl != 'string'
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                  ),
                  onPressed: () => openUrl(source.facebookUrl),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
