void main(List<String> args) {
  final me = Person(age: 30);
  final meNextYear = me + 1;
  print(meNextYear);
}

class Person {
  final int age;

  Person({required this.age});

  Person operator +(int age) => Person(
        age: this.age + age,
      );
  @override
  String toString() => 'Person $age';
}
