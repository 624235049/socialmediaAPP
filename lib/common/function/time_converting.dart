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
    String monthSelect = (fullMonth == true) ? 'month' : 'month_less';
    String year = dateText.toString().substring(0,4);
    String month = dateText.toString().substring(5,7);
    String day = dateText.toString().substring(8,10);

    month = (month == '01') ? LanguageBuilder.texts![monthSelect]['jan']
                            : (month == '02') ? LanguageBuilder.texts![monthSelect]['feb']
                            : (month == '03') ? LanguageBuilder.texts![monthSelect]['mar']
                            : (month == '04') ? LanguageBuilder.texts![monthSelect]['apr']
                            : (month == '05') ? LanguageBuilder.texts![monthSelect]['may']
                            : (month == '06') ? LanguageBuilder.texts![monthSelect]['jun']
                            : (month == '07') ? LanguageBuilder.texts![monthSelect]['jul']
                            : (month == '08') ? LanguageBuilder.texts![monthSelect]['aug']
                            : (month == '09') ? LanguageBuilder.texts![monthSelect]['sep']
                            : (month == '10') ? LanguageBuilder.texts![monthSelect]['oct']
                            : (month == '11') ? LanguageBuilder.texts![monthSelect]['nov']
                            : (month == '12') ? LanguageBuilder.texts![monthSelect]['dec']
                            : '[invalid]';
    return '$day $month $year'; 
  }
}