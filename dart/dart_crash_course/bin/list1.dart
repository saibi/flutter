void main(List<String> args) {
  const names = ["foo", "bar", "baz", "qux"];

  for (final name in names.where((name) => name.startsWith("b"))) {
    print(name);
  }
  print("-----");
  names.sublist(1, 4).forEach((element) {
    print(element);
  });

  final l = names.map((e) => e.length);
  print(l);
  final s = l.toSet();
  print(s);

  final numbers = [1, 2, 3, 4, 5];

  final result = numbers.fold(0, (prev, element) => prev + element);
  print(result);
}
