void main(List<String> args) {
  print([1, 2, 3].containsDuplicateValues);
  print([1, 2, 3, 2].containsDuplicateValues);
  print(['foo', 'foo'].containsDuplicateValues);
  print(['foo', 'bar'].containsDuplicateValues);
}

extension on Iterable {
  bool get containsDuplicateValues => toSet().length != length;
}
