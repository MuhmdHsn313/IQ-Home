import 'package:flutter/material.dart';

import '../models/area_statics.dart';
import '../screens/in_status.dart';

class StateCard extends StatelessWidget {
  final AreaStatics area;

  const StateCard({Key key, this.area}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        // onTap: () => Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => BlocProvider<StaticslineBloc>(
        //       create: (context) =>
        //           StaticslineBloc(area)..add(FetchStaticsline()),
        //       child: InStatus(),
        //     ),
        //   ),
        // ),
        borderRadius: BorderRadius.circular(15),
        child: Material(
          elevation: 2.5,
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
                        area.recovered,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Color(0xffFCA206),
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
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 2.5),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).errorColor,
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          area.recovered,
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
                          area.cases,
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
                          area.deaths,
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
      ),
    );
  }
}