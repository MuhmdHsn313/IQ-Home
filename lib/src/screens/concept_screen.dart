import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../blocs/concept/bloc.dart';
import '../widgets/concept_card.dart';

class ConceptScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: Container(
            height: 200,
            child: Material(
              color: Theme.of(context).cardColor,
              elevation: 2.5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    Hero(
                      tag: 'assets/images/concept.svg',
                      child: SvgPicture.asset(
                        'assets/images/concept.svg',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Hero(
                      tag: 'تصحيح المفاهيم المغلوطة',
                      child: Text(
                        'تصحيح المفاهيم المغلوطة',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(190),
      ),
      body: BlocBuilder<ConceptBloc, ConceptState>(
        bloc: BlocProvider.of<ConceptBloc>(context),
        builder: (context, state) {
          if (state is ConceptSuccessfulLoaded)
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              physics: BouncingScrollPhysics(),
              itemBuilder: (c, i) => ConceptCard(
                concept: state.concepts[i],
              ),
              separatorBuilder: (c, i) => SizedBox(
                height: 5,
              ),
              itemCount: 5,
            );

          if (state is HandleConceptError)
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
                    'حدث خطأ ما!',
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
