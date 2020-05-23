import 'package:date_time_format/date_time_format.dart';

class StringTimeGenerator {
  static String get(DateTime date) {
    final DateTime now = DateTime.now();
    String currentTime;

    if (now.minute == date.minute)
      currentTime = 'الان';
    else if (date.minute < now.minute && date.hour == now.hour)
      currentTime = 'منذ ${now.month - date.minute} دقائق';
    else if (now.hour > date.hour &&
        now.day == date.day &&
        now.month == date.month &&
        now.year == date.year)
      currentTime = 'منذ ${now.hour - date.hour} ساعة';
    else if (now.day == date.day &&
        now.month == date.month &&
        now.year == date.year)
      currentTime = 'في ' + DateTimeFormat.format(date, format: 'h:i a');
    else if (now.year == date.year)
      currentTime = DateTimeFormat.format(date, format: 'M j') +
          ' في ' +
          DateTimeFormat.format(date, format: 'h:i a');
    else
      currentTime =
          DateTimeFormat.format(date, format: DateTimeFormats.american);
    return currentTime;
  }
}
