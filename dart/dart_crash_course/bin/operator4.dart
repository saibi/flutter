void main(List<String> args) {
  print([1, 2, 3] - [1, 2]);
  print([1, 2, 3] - [1, 4]);
  print([1, 2, 3] - [1, 2, 3]);
  print(['foo', 'bar', 'bz'] - ['bar', 'bz']);
}

extension Remove<T> on Iterable<T> {
  Iterable<T> operator -(Iterable<T> other) =>
      where((element) => !other.contains(element));
}
