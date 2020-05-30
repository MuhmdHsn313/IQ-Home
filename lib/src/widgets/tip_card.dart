import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iqhome/src/models/tip.dart';
import 'package:iqhome/src/screens/tip_screen.dart';

class TipCard extends StatelessWidget {
  final Tip tip;

  const TipCard({Key key, @required this.tip})
      : assert(tip != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TipScreen(tip: tip),
        ),
      ),
      child: Container(
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
                  tag: '${tip.id}-tip-image',
                  child: Image(
                    color: Theme.of(context).cardColor,
                    image: CachedNetworkImageProvider(tip.cover),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Hero(
                  tag: '${tip.id}-tip-title',
                  child: Text(
                    tip.title,
                    style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 18),
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
