void main(List<String> args) {
  const names = ["foo", "bar", "baz"];

  for (final name in names.reversed) {
    print(name);
  }

  for (final value in Iterable.generate(5)) {
    print(value);
  }
}
