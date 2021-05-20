import 'package:flutter_test/flutter_test.dart';
import 'package:thailand_covid_19/helper/date_time.dart';

void main() {
  group('DateTime Helper', () {
    test('convert format date with buddish era', () {
      DateTime actual =
          DateTimeHelper().convertFormatDateWithBE("01/02/2020 03:04");
      DateTime expected = DateTime(2563, 2, 1, 3, 4);
      expect(actual, expected);
    });
  });
}
