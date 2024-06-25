import 'package:flutter/foundation.dart';

int fibonacci(int n) {
  if (n == 0 || n == 1) {
    return n;
  }
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main() {
  final result = compute(fibonacci, 20);
  result.then((value) {
    print('Fibonacci: $value');
  });
}
