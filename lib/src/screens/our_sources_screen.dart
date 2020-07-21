import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../blocs/source/bloc.dart';
import '../widgets/source_card.dart';

class OurSourcesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("مصادر المعلومات"),
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            height: 180,
            color: Theme.of(context).cardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/images/cfi_logo.svg',
                  height: 105,
                  width: 105,
                ),
                Text(
                  "جميع المصادر هي مصادر رسمية",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 23),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          BlocBuilder<SourceBloc, SourceState>(
            bloc: BlocProvider.of<SourceBloc>(context),
            builder: (context, state) {
              print(state);
              if (state is SourceSuccessfulLoaded) {
                if (state.sources.isEmpty)
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.sentiment_dissatisfied,
                        size: 75,
                        color: Theme.of(context).disabledColor,
                      ),
                      Text(
                        'لا توجد مصادر!',
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                              color: Theme.of(context).disabledColor,
                            ),
                      ),
                    ],
                  );

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List<Widget>.generate(
                    state.sources.length * 2,
                    (index) {
                      if (index % 2 == 0)
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: SourceCard(
                            source: state.sources[index - (index ~/ 2)],
                          ),
                        );
                      return SizedBox(
                        height: 5,
                      );
                    },
                  ),
                );
              }
              if (state is SourceLoadError)
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sentiment_dissatisfied,
                      size: 75,
                      color: Theme.of(context).disabledColor,
                    ),
                    Text(
                      'Error: ${state.error}',
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: Theme.of(context).disabledColor,
                          ),
                    ),
                  ],
                );

              return SpinKitCircle(
                color: Theme.of(context).primaryColor,
              );
            },
          ),
        ],
      ),
    );
  }
}
