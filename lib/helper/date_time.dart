import 'package:intl/intl.dart';

class DateTimeHelper {
  DateTime convertFormatDateWithBE(String dateString,
      {String format = "dd/MM/yyyy HH:mm"}) {
    DateTime date = DateFormat(format).parse(dateString);
    return DateTime(
        date.year + 543, date.month, date.day, date.hour, date.minute);
  }
}
