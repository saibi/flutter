void main(List<String> args) async {
  // normal
  // for (final value in names()) {}

  // Stream
  // await for (final number in getNumbers()) {
  //   print(number);
  // }

  // Stream with exception
  try {
    await for (final name in getNames()) {
      print(name);
    }
  } catch (e) {
    print(e);
  }
}

List<String> names() => ['John', 'Doe'];

Stream<int> getNumbers() async* {
  for (var i = 0; i < 10; i++) {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    yield i;
  }
}

Stream<String> getNames() async* {
  await Future.delayed(const Duration(seconds: 1));
  yield "John";
  await Future.delayed(const Duration(seconds: 1));
  yield "Doe";
  throw Exception("Something went wrong");
  //yield "Another";
}
