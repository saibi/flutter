import 'dart:math' show Random;

void main(List<String> args) {
  print(add.callWithRandomValues());
  print(sub.callWithRandomValues());
}

int add(int a, int b) => a + b;

int sub(int a, int b) => a - b;

typedef IntFunction = int Function(int, int);

extension on IntFunction {
  int callWithRandomValues() {
    final rnd1 = Random().nextInt(100);
    final rnd2 = Random().nextInt(100);
    print('Random values = $rnd1, $rnd2');
    return this.call(rnd1, rnd2);
  }
}
