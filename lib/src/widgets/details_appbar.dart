import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final String screenName;
  final String svgPath;
  final String imgPath;

  const DetailsAppBar({
    Key key,
    @required this.title,
    @required this.svgPath,
    @required this.imgPath,
    @required this.subtitle,
    @required this.screenName,
  })  : assert(title != null),
        this.preferredSize = const Size.fromHeight(275),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Theme.of(context).disabledColor),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).disabledColor,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(imgPath),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              subtitle,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  screenName,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                SvgPicture.asset(
                                  svgPath,
                                  height: 20,
                                  width: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
