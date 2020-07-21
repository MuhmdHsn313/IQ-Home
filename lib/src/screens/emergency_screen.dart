import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../blocs/emergency/bloc.dart';
import '../widgets/emergency_number.dart';

class EmergencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("ارقام الطوارئ"),
        backgroundColor: Theme.of(context).errorColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocBuilder<EmergencyBloc, EmergencyState>(
        bloc: BlocProvider.of<EmergencyBloc>(context),
        builder: (context, state) {
          if (state is EmergenciesLoaded)
            return ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    height: 179,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/emergency.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "* اضغط على الجهة التي تريد الاتصال بها",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: Theme.of(context).disabledColor),
                  ),
                ),
                ...List<Widget>.generate(
                  state.emergencies.length * 2,
                  (index) {
                    if (index % 2 == 0) return EmergencyNumber(
                      emergency: state.emergencies[index - (index ~/ 2)],
                    );
                    return SizedBox(height: 5);
                  },
                ),
                SizedBox(height: 10),
              ],
            );

          if (state is EmergencyError)
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
                    'Error: ${state.error}',
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: Theme.of(context).disabledColor,
                        ),
                  ),
                ],
              ),
            );

          return SpinKitCircle(
            color: Theme.of(context).errorColor,
          );
        },
      ),
    );
  }
}
