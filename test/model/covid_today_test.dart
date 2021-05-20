import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:thailand_covid_19/model/covid_today.dart';

void main() {
  initializeDateFormatting("th");
  group('DateTime Helper', () {
    test('convert format date with buddish era', () {
      String actual = CovidToday.fromJson({
        "UpdateDate": "20\/05\/2021 11:24",
      }).updateDate;
      var expected = "20 พ.ค. 2564 เวลา 11:24 น.";
      expect(actual, expected);
    });
  });
}
