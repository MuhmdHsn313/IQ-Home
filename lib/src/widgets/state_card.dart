import 'package:flutter/material.dart';

import '../models/area_statics.dart';

class StateCard extends StatelessWidget {
  final AreaStatics area;

  const StateCard({Key key, this.area}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        area.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Text(
                      area.total.recovered.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Color(0xffFCA206)),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 2.5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).errorColor,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        area.today.recovered.toString(),
                        style: TextStyle(
                          color: Theme.of(context).errorColor,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 2.5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        area.today.active.toString(),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 2.5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff434343),
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        area.today.deaths.toString(),
                        style: TextStyle(
                          color: Color(0xff434343),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
