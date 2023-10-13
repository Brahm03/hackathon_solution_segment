import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String toDdMm() {
    return "${_convert(day)}.${_convert(month)}.${_convert(year)}";
  }

  String toDdMmHmMm() {
    return "${_convert(day)}.${_convert(month)}.${_convert(year)} ${_convert(hour)}:${_convert(minute)}";
  }

  String _convert(int? num) {
    if (num! < 10 && num >= 0) {
      return "0$num";
    } else {
      return num.toString();
    }
  }

  String toHHMM() {
    var formatter = DateFormat('HH:mm');
    var formatted = formatter.format(this);
    return formatted;
  }
  String toHHMMSS() {
    var formatter = DateFormat('HH:mm ');
    var formatted = formatter.format(this);
    return formatted;
  }
}

extension DateInt on int {
  String fromSeconds() {
    int sec = this % 60;
    int min = (this / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  String toDate() {
    var date = DateTime.fromMillisecondsSinceEpoch(this);
    return "${date.day}.${date.month}.${date.year} ${date.hour}:${date.minute}:${date.second}";
  }
}

extension DateFormatExt on String {
  String toDate() {
    try {
      DateTime now = DateTime.parse(this);
      var formatter = DateFormat('dd.MM.yyyy');
      var formatted = formatter.format(now);
      return formatted;
    } catch (e) {
      return this;
    }
  }

  DateTime toDateTime() {
    DateTime now = DateTime.parse(this);
    return now;
  }

  String toIso() {
    DateTime date = DateTime.parse(this);
    return date.toIso8601String();
  }

  String toIsoFromDDHH() {
    final dateString = this;
    final parsedDate = DateFormat('dd.MM.yyyy').parse(dateString);
    final isoDate = DateFormat('yyyy-MM-ddTHH:mm:ss').format(parsedDate);
    return isoDate;
  }

  bool isToday() {
    DateTime date = DateTime.parse(this);
    DateTime today = DateTime.now();
    return "${date.day}${date.month}${date.year}" ==
        "${today.day}${today.month}${today.year}";
  }
}

String today() {
  DateTime today = DateTime.now();
  return "${today.day}${today.month}${today.year}";
}

extension DateTimeExtNullable on DateTime? {
  String? toDDMM() {
    return this == null
        ? null
        : "${(_convert(this?.day))}.${(_convert(this?.month))}.${(_convert(this?.year))}";
  }

  String? toFullDate() {
    if (this != null) {
      var max = DateFormat("dd.MM.yyyy HH:mm");
      return max.format(this!);
    } else {
      return null;
    }
  }

  String _convert(int? num) {
    if (num! < 10 && num >= 0) {
      return "0$num";
    } else {
      return num.toString();
    }
  }
}

extension DateTimeExtStrList on List<String> {
  String? lastDate() {
    if (isNotEmpty) {
      try {
        var max = DateFormat("dd.MM.yyyy HH:mm").parse(this[0]);

        forEach((element) {
          DateTime tempDate = DateFormat("dd.MM.yyyy HH:mm").parse(element);
          if (tempDate.isAfter(max)) {
            max = tempDate;
          }
        });
        return max.toDdMm();
      } catch (e) {
        try {
          var max = DateTime.parse(this[0]);

          forEach((element) {
            DateTime tempDate = DateTime.parse(element);
            if (tempDate.isAfter(max)) {
              max = tempDate;
            }
          });
          return max.toDdMm();
        } catch (e) {
          return null;
        }
      }
    } else {
      return null;
    }
  }
}
