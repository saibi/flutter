void main(List<String> args) {
  final string = 'abracadabra';

  var result = '';

  for (final letter in string.split('')) {
    if (letter == 'a' || letter == 'b' || letter == 'c') {
    } else {
      result += letter;
    }
  }
  print(result);

  var result2 = {
    for (final char in string.split('')) 'abc'.contains(char) ? null : char
  }
    ..removeAll([null])
    ..cast<String>();
  print(result2);

  final allNumbers = Iterable.generate(10);
  final evenNumber = [
    for (final number in allNumbers)
      if (number % 2 == 0) number
  ];
  print(evenNumber);
  final evenNumber2 = allNumbers.where(
    (number) => number % 2 == 0,
  );

  print(evenNumber2);
  print("------");

  final names = ['foo', 'bar'];
  final namesAndLength = {for (final name in names) name: name.length};
  print(namesAndLength);
}
