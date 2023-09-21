void main(List<String> args) {
  final bla = Person(age: 20);
  final bla2 = Person(age: 20.2);

  print(bla.ageRounded);
  print(bla2.ageRounded);
}

class Person<T extends num> {
  final T age;

  const Person({required this.age});

  int get ageRounded => age.round();
}
