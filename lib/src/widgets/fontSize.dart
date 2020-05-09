import 'package:flutter/material.dart';
import 'package:iqhome/src/utils/public_type.dart';

class FontSizeWidget extends StatelessWidget {
  final AppFontSize size;

  const FontSizeWidget({
    Key key,
    this.size: AppFontSize.Middle,
  })  : assert(size != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize;
    switch (size) {
      case AppFontSize.Small:
        fontSize = 14;
        break;
      case AppFontSize.Middle:
        fontSize = 16;
        break;
      case AppFontSize.Large:
        fontSize = 18;
        break;
      case AppFontSize.Giant:
        fontSize = 22;
        break;
      default:
        fontSize = 14;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("حجم الخط", style: Theme.of(context).textTheme.subtitle1),
        ),
        Container(
          height: 48,
          color: Colors.white,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SelectFontSize(
                title: 'صغير',
                isSelected: size == AppFontSize.Small,
              ),
              SelectFontSize(
                title: 'متوسط',
                isSelected: size == AppFontSize.Middle,
              ),
              SelectFontSize(
                title: 'كبير',
                isSelected: size == AppFontSize.Large,
              ),
              SelectFontSize(
                title: 'عملاق',
                isSelected: size == AppFontSize.Giant,
              ),
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(right: 32, left: 32, top: 10, bottom: 20),
          child: Text(
            "هذا الخط هو مثال عن الحجم الذي اخترته..."
            "اختر ماينسابك من حجم الخط حيث يكون مريح في القراءة بالنسبة لك.",
            style: TextStyle(
              color: Color(0xffB0B0B0),
              fontSize: fontSize,
            ),
          ),
        )
      ],
    );
  }
}

class SelectFontSize extends StatelessWidget {
  final String title;
  final bool isSelected;

  const SelectFontSize({
    Key key,
    @required this.title,
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
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          color: isSelected ? Colors.white : Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
