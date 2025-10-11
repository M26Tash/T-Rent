import 'package:flutter_test/flutter_test.dart';

int add(int a, int b) => a + b;
void main() {
  test('adds two numbers', () {
    const num1 = 2;
    const num2 = 3;

    final result = add(num1, num2);

    expect(result, 5);
  });
}
