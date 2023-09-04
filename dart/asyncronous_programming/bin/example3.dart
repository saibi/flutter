void main(List<String> args) async {
  // final length = await calculateLength(await getFullName());
  // print(length);

  // getFullName()
  //     .then((value) => calculateLength(value))
  //     .then((value) => print(value));
  // print('hello');

  // final length = getFullName()
  //     .then((value) => calculateLength(value))
  //     .then((value) => value);
  // print(length);
  // print('hello');

  final length = await getFullName()
      .then((value) => calculateLength(value))
      .then((value) => value);
  print(length);
  print('hello');
}

Future<String> getFullName() => Future.delayed(
      const Duration(seconds: 1),
      () => 'John Doe',
    );

Future<int> calculateLength(String value) => Future.delayed(
      const Duration(seconds: 1),
      () => value.length,
    );
