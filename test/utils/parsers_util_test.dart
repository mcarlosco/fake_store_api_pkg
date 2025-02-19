import 'package:fake_store_api_pkg/src/utils/parsers_util.dart';
import 'package:test/test.dart';

void main() {
  const string_ = 'one';
  const int_ = 1;
  const double_ = 1.0;

  group('parseIntOrDefault', () {
    test('Returns the given integer\' string representation but parsed', () {
      expect(parseIntOrDefault(int_.toString()), equals(int_));
    });

    test('Returns integer default', () {
      expect(parseIntOrDefault(string_), isZero);
    });
  });

  group('parseDoubleOrDefault', () {
    test('Returns the given double\' string representation but parsed', () {
      expect(parseDoubleOrDefault(double_.toString()), equals(double_));
    });

    test('Returns double default', () {
      expect(parseDoubleOrDefault(string_), isZero);
    });
  });
}
