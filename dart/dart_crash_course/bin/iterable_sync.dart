void main(List<String> args) {
  for (final name in getNames()) {
    print(name);
  }
}

Iterable<String> getNames() sync* {
  print("produce bob");
  yield 'bob';
  print("produce alice");
  yield 'alice';
  print("produce joe");
  yield 'joe';
  print("produce templatenames");
  yield* templateNames();
}

Iterable<String> templateNames() sync* {
  print("produce foo");
  yield 'foo';
  print("produce bar");
  yield 'bar';
  print("produce baz");
  yield 'baz';
}
