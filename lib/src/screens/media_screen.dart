import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../blocs/media/bloc.dart';
import '../widgets/media_card.dart';

class MediaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفيديوهات'),
        centerTitle: true,
      ),
      body: BlocBuilder<MediaBloc, MediaState>(
        bloc: BlocProvider.of<MediaBloc>(context),
        builder: (context, state) {
          if (state is MediaSuccessfulLoaded)
            return ListView.separated(
              padding: EdgeInsets.all(8.0),
              itemBuilder: (c, i) => MediaCard(media: state.medias[i]),
              separatorBuilder: (c, i) => SizedBox(
                height: 5,
              ),
              itemCount: state.medias.length,
            );

          if (state is MediaHandleError)
            return Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sentiment_dissatisfied,
                    size: 75,
                    color: Theme.of(context).disabledColor,
                  ),
                  Text(
                    'حدث خطأ!',
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: Theme.of(context).disabledColor,
                        ),
                  ),
                ],
              ),
            );

          return SpinKitCircle(
            color: Theme.of(context).primaryColor,
          );
        },
      ),
    );
  }
}
