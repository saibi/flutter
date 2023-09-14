void main(List<String> args) {
  final iterable = Iterable.generate(20, (i) => getName(i));
  //print(iterable);

  // lazy evaluated
  for (final name in iterable.take(2)) {
    print(name);
  }

  const names = ["john", "jane", "jack", "jill"];
  final upperNames = names.map((name) {
    print("map() called");
    return name.toUpperCase();
  });
  for (final name in upperNames.take(2)) {
    print(name);
  }
}

String getName(int i) {
  print('getName() called');
  return "John #$i";
}
