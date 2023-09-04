void main(List<String> args) async {
  await for (final name in allNames()) {
    print(name);
  }
}

Stream<String> maleNames() async* {
  yield "John";
  yield "Peter";
  yield "Paul";
}

Stream<String> femaleNames() async* {
  yield "Mary";
  yield "Jane";
  yield "Sue";
}

Stream<String> allNames() async* {
  // await for (final name in maleNames()) {
  //   yield name;
  // }
  // await for (final name in femaleNames()) {
  //   yield name;
  // }
  // same code using yield*

  yield* maleNames();
  yield* femaleNames();
}
