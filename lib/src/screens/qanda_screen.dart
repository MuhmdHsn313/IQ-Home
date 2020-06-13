import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../blocs/qna/bloc.dart';
import '../widgets/details_appbar.dart';
import '../widgets/qanda_card.dart';

class QandAScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<QnABloc, QnAState>(
          bloc: BlocProvider.of<QnABloc>(context),
          builder: (context, state) {
            if (state is QnALoadedState)
              return ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  DetailsAppBar(
                    title: 'أسئلة حول مرض كوفيد-19',
                    svgPath: 'assets/images/q&a.svg',
                    imgPath: 'assets/images/questions.svg',
                    subtitle:
                        'هذه الأسئلة تساعدك على فهم ما يتعلق  بمرض كوفيد-19 ' +
                            '\n' +
                            'دعنا نهتم ببعضنا من خلال معرفة وضعنا, ومحاولة عدم نقل العدوى للآخرين, وتوفير الرعاية لمن يحتاجون اليها.',
                    screenName: 'سؤال وجواب',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ...List.generate(
                    state.qna.length * 2,
                    (index) {
                      if (index % 2 == 0)
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 15),
                          child: QandACard(
                            qandA: state.qna[index - (index ~/ 2)],
                          ),
                        );
                      return SizedBox(height: 5);
                    },
                  ),
                ],
              );

            if (state is QnAErrorState)
              return Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    DetailsAppBar(
                      title: 'أسئلة حول مرض كوفيد-19',
                      svgPath: 'assets/images/q&a.svg',
                      imgPath: 'assets/images/questions.svg',
                      subtitle:
                          'هذه الأسئلة تساعدك على فهم ما يتعلق  بمرض كوفيد-19 ' +
                              '\n' +
                              'دعنا نهتم ببعضنا من خلال معرفة وضعنا, ومحاولة عدم نقل العدوى للآخرين, وتوفير الرعاية لمن يحتاجون اليها.',
                      screenName: 'سؤال وجواب',
                    ),
                    Expanded(
                      child: Column(
//                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sentiment_dissatisfied,
                            size: 75,
                            color: Theme.of(context).disabledColor,
                          ),
                          Text(
                            'Error: ${state.message}',
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      color: Theme.of(context).disabledColor,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );

            return Column(
              children: [
                DetailsAppBar(
                  title: 'أسئلة حول مرض كوفيد-19',
                  svgPath: 'assets/images/q&a.svg',
                  imgPath: 'assets/images/questions.svg',
                  subtitle: 'هذه الأسئلة تساعدك على فهم ما يتعلق  بمرض كوفيد-19 ' +
                      '\n' +
                      'دعنا نهتم ببعضنا من خلال معرفة وضعنا, ومحاولة عدم نقل العدوى للآخرين, وتوفير الرعاية لمن يحتاجون اليها.',
                  screenName: 'سؤال وجواب',
                ),
                Spacer(),
                SpinKitCircle(
                  color: Theme.of(context).primaryColor,
                ),
                Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }
}
