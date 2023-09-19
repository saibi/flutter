void main(List<String> args) {
  print('Foo Bar' - 'Foo');

  final str = 'foo bar bar';
  print(str - 'foo');
  print(str);
}

extension Remove on String {
  String operator -(String other) {
    return replaceAll(other, '');
  }
}
