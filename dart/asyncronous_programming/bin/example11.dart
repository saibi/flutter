void main(List<String> args) async {
  print("start");
  final allNames = await getNames().toList();
  print(allNames);
  print("end");

  print("-----");

  print("start");
  final futureNames = getNames().toList();
  futureNames.then((value) => print(value));
  print("end");
}

Stream<String> getNames() async* {
  yield "John";
  await Future.delayed(Duration(seconds: 1));
  yield "Jane";
  await Future.delayed(Duration(seconds: 1));
  yield "Jack";
}
