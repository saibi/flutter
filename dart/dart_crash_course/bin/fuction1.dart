void main(List<String> args) {
  makeUpperCase();
  makeUpperCase('Foo');
  makeUpperCase('Foo', 'BBBB');
}

void makeUpperCase([
  String? name,
  String lastName = 'Bar',
]) {
  print(name?.toUpperCase());
  print(lastName.toUpperCase());
}
