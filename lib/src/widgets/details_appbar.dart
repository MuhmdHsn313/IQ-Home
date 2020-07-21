import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsAppBar extends StatelessWidget {
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
        super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Container(
          height: 275,
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Theme.of(context).disabledColor,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
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
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
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
                                  Hero(
                                    tag: title,
                                    child: Text(
                                      screenName,
                                      style: Theme.of(context).textTheme.headline6,
                                    ),
                                  ),
                                  Hero(
                                    tag: svgPath,
                                    child: SvgPicture.asset(
                                      svgPath,
                                      height: 20,
                                      width: 20,
                                      color: Theme.of(context).primaryColor,
                                    ),
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
              ),
            ],
          ),
        ),
      );
}
