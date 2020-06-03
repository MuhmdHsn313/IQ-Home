import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqhome/src/blocs/app_settings/app_settings_bloc.dart';
import 'package:iqhome/src/blocs/app_settings/app_settings_event.dart';
import 'package:iqhome/src/blocs/app_settings/app_settings_state.dart';
import 'package:iqhome/src/utils/public_type.dart';

class FontSizeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsBloc, AppSettingsState>(
      bloc: BlocProvider.of<AppSettingsBloc>(context),
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("حجم الخط",
                  style: Theme.of(context).textTheme.subtitle1),
            ),
            Container(
              height: 50,
              color: Theme.of(context).cardColor,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SelectFontSize(
                    title: 'صغير',
                    scale: AppFontScale.Small,
                    isSelected: state.size == AppFontScale.Small,
                  ),
                  SelectFontSize(
                    title: 'متوسط',
                    scale: AppFontScale.Middle,
                    isSelected: state.size == AppFontScale.Middle,
                  ),
                  SelectFontSize(
                    title: 'كبير',
                    scale: AppFontScale.Large,
                    isSelected: state.size == AppFontScale.Large,
                  ),
                  SelectFontSize(
                    title: 'عملاق',
                    scale: AppFontScale.Giant,
                    isSelected: state.size == AppFontScale.Giant,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 32, left: 32, top: 10, bottom: 20),
              child: Text(
                "هذا الخط هو مثال عن الحجم الذي اخترته..."
                "اختر ماينسابك من حجم الخط حيث يكون مريح في القراءة بالنسبة لك.",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            )
          ],
        );
      },
    );
  }
}

class SelectFontSize extends StatelessWidget {
  final String title;
  final bool isSelected;
  final AppFontScale scale;

  const SelectFontSize({
    Key key,
    @required this.title,
    @required this.scale,
    @required this.isSelected,
  })  : assert(title != null),
        assert(isSelected != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31,
      width: 95,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
        color: isSelected ? Theme.of(context).primaryColor : Colors.white,
      ),
      child: InkWell(
        onTap: () => BlocProvider.of<AppSettingsBloc>(context)
            .add(ChangeFontScale(scale)),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.white : Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
