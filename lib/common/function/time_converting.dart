import 'package:language_builder/language_builder.dart';

class TimeConverting {
  // Calculating different of timestamp and current time
  static Duration timeDifNow(String timeStamp) {
    return DateTime.now()
        .difference(DateTime.fromMillisecondsSinceEpoch(int.parse(timeStamp)));
  }

  // returning sentence of time (ex. 15 minutes ago, 1 hour ago, just now)
  static String extractTime(String timeStamp) {
    return ((timeDifNow(timeStamp).inHours > 23)
        ? (timeDifNow(timeStamp).inHours ~/ 24).toString() +
            ' ' +
            LanguageBuilder.texts!['time_stamp']['day'] +
            (((timeDifNow(timeStamp).inHours ~/ 24) > 1)
                ? (LanguageBuilder.texts!['time_stamp']['suffix'])
                : ' ')
        : (timeDifNow(timeStamp).inHours > 0)
            ? (timeDifNow(timeStamp).inHours).toString() +
                ' ' +
                LanguageBuilder.texts!['time_stamp']['hour'] +
                ((timeDifNow(timeStamp).inHours > 1)
                    ? (LanguageBuilder.texts!['time_stamp']['suffix'])
                    : ' ')
            : (timeDifNow(timeStamp).inMinutes > 0)
                ? (timeDifNow(timeStamp).inMinutes).toString() +
                    ' ' +
                    LanguageBuilder.texts!['time_stamp']['minute'] +
                    ((timeDifNow(timeStamp).inMinutes > 1)
                        ? (LanguageBuilder.texts!['time_stamp']['suffix'])
                        : ' ')
                : (timeDifNow(timeStamp).inSeconds > 1)
                    ? (timeDifNow(timeStamp).inSeconds).toString() +
                        ' ' +
                        LanguageBuilder.texts!['time_stamp']['second'] +
                        LanguageBuilder.texts!['time_stamp']['suffix']
                    : LanguageBuilder.texts!['time_stamp']['just_now']);
  }

  static String getDate(String dateText, bool fullMonth) {
    String _monthSelect = (fullMonth == true) ? 'month' : 'month_less';
    int _year = int.parse(dateText.toString().substring(0,4)) + int.parse(LanguageBuilder.texts!['time_stamp']['year_diff']);
    int _month = int.parse(dateText.toString().substring(5,7));
    int _day = int.parse(dateText.toString().substring(8,10));

    String _monthConverted = (_month == 1) ? LanguageBuilder.texts![_monthSelect]['jan']
                            : (_month == 2) ? LanguageBuilder.texts![_monthSelect]['feb']
                            : (_month == 3) ? LanguageBuilder.texts![_monthSelect]['mar']
                            : (_month == 4) ? LanguageBuilder.texts![_monthSelect]['apr']
                            : (_month == 5) ? LanguageBuilder.texts![_monthSelect]['may']
                            : (_month == 6) ? LanguageBuilder.texts![_monthSelect]['jun']
                            : (_month == 7) ? LanguageBuilder.texts![_monthSelect]['jul']
                            : (_month == 8) ? LanguageBuilder.texts![_monthSelect]['aug']
                            : (_month == 9) ? LanguageBuilder.texts![_monthSelect]['sep']
                            : (_month == 10) ? LanguageBuilder.texts![_monthSelect]['oct']
                            : (_month == 11) ? LanguageBuilder.texts![_monthSelect]['nov']
                            : (_month == 12) ? LanguageBuilder.texts![_monthSelect]['dec']
                            : '[invalid]';
    return '$_day $_monthConverted $_year'; 
  }
}