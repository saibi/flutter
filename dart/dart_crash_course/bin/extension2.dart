void main(List<String> args) {
  final sumInt = [1, 2, 3].sum;
  final sumDouble = [1.1, 2.2].sum;

  print(sumInt);
  print(sumDouble);
}

extension SumOfIterable<T extends num> on Iterable<T> {
  T get sum => reduce((a, b) => a + b as T);
}
