import 'package:fake_store_api_pkg/src/utils/formatters_util.dart';
import 'package:test/test.dart';

void main() {
  const representation = '''
{
  y: true,
  n: false,
}''';

  group('formatPretty', () {
    test(
        'Returns representation formatted as if the object was a child of another one',
        () {
      final formatted = '''
{
    y: true,
    n: false,
  }''';

      expect(formatPretty(representation), equals(formatted));
    });
  });

  group('formatPrintable', () {
    test(
        'Returns none-element list\'s representation formatted to be printed in console',
        () {
      expect(formatPrintable([]), isEmpty);
    });

    test(
        'Returns single-element list representation formatted to be printed in console',
        () {
      final formatted = '''

$representation
''';

      expect(formatPrintable([representation]), equals(formatted));
    });

    test(
        'Returns multiple-elements list representation formatted to be printed in console',
        () {
      final formatted = '''

$representation

$representation
''';

      expect(
          formatPrintable([representation, representation]), equals(formatted));
    });
  });
}
