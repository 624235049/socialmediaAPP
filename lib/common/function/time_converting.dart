import 'package:language_builder/language_builder.dart';

class TimeConverting {
  // Calculating different of timestamp and current time
  Duration timeDifNow(String timeStamp) {
    return DateTime.now()
        .difference(DateTime.fromMillisecondsSinceEpoch(int.parse(timeStamp)));
  }

  // returning sentence of time (ex. 15 minutes ago, 1 hour ago, just now)
  String extractTime(String timeStamp) {
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
}