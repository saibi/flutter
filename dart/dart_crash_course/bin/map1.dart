void main(List<String> args) {
  final info = {
    "name": "foo",
    "age": 18,
  };

  info.putIfAbsent("height", () => 180);

  print(info);

  print("-----");
  for (final entry in info.entries) {
    print(entry.key);
    print(entry.value);
  }
  print("-----");
}
