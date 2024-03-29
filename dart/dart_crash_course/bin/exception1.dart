void main(List<String> args) {
  tryCreatingPerson(age: 20);
  tryCreatingPerson(age: 145);
  tryCreatingPerson(age: -1);
}

void tryCreatingPerson({int age = 0}) {
  try {
    print(Person(age: age).age);
  } catch (e) {
    print(e.runtimeType);
    print(e);
  }

  print("-----");
}

class Person {
  final int age;

  Person({required this.age}) {
    if (age < 0) {
      throw Exception("age must be positive");
    } else if (age > 140) {
      throw Exception("age must be less than 140");
    }
  }
}
