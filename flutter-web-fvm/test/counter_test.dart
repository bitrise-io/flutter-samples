import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_fvm/counter.dart';

void main() {
  group('Counter', () {
    late Counter counter;

    setUp(() {
      counter = Counter();
    });

    test('starts at zero', () {
      expect(counter.value, 0);
    });

    test('increments value', () {
      counter.increment();
      expect(counter.value, 1);
    });

    test('decrements value', () {
      counter.increment();
      counter.decrement();
      expect(counter.value, 0);
    });

    test('resets to zero', () {
      counter.increment();
      counter.increment();
      counter.reset();
      expect(counter.value, 0);
    });
  });
}
