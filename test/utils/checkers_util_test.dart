import 'package:fake_store_api_pkg/src/utils/checkers_util.dart';
import 'package:test/test.dart';

void main() {
  const string_ = 'one';
  const int_ = 1;
  const double_ = 1.0;

  group('checkStringOrDefault', () {
    test('Returns the given string', () {
      expect(checkStringOrDefault(string_), equals(string_));
    });

    test('Returns string default', () {
      expect(checkStringOrDefault(int_), isEmpty);
    });
  });

  group('checkIntOrDefault', () {
    test('Returns the given integer', () {
      expect(checkIntOrDefault(int_), equals(int_));
    });

    test('Returns the given integer\' string representation but parsed', () {
      expect(checkIntOrDefault(int_.toString()), equals(int_));
    });

    test('Returns integer default', () {
      expect(checkIntOrDefault(string_), isZero);
    });
  });

  group('checkDoubleOrDefault', () {
    test('Returns the given double', () {
      expect(checkDoubleOrDefault(double_), equals(double_));
    });

    test('Returns the given double\' string representation but parsed', () {
      expect(checkDoubleOrDefault(double_.toString()), equals(double_));
    });

    test('Returns double default', () {
      expect(checkDoubleOrDefault(string_), isZero);
    });
  });
}
