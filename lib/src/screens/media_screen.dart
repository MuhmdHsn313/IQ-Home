import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../blocs/media/bloc.dart';
import '../widgets/media_card.dart';
import 'qanda_details_screen.dart';

class MediaScreen extends StatefulWidget {

  @override
  _MediaScreenState createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
   Future<bool> _back(){
        if( MediaQuery.of(context).orientation == Orientation.landscape){
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);
          // Navigator.pop(context);

        }
        if( MediaQuery.of(context).orientation == Orientation.portrait){
          
           Navigator.pop(context);

        }
        //  Navigator.pop(context);
         return null ;
      }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:_back ,
          child: Scaffold(
        appBar: CustomAppBar(
                  appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: _back),
            title: Text('الفيديوهات'),
            centerTitle: true,
          ),
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
      ),
    );



  }
}
