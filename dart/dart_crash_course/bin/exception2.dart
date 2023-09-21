void main(List<String> args) {
  tryCreatingPerson(age: 20);
  tryCreatingPerson(age: 145);
  tryCreatingPerson(age: -1);
}

void tryCreatingPerson({int age = 0}) {
  try {
    print(Person(age: age).age);
  } on InvalidAgeException catch (e, st) {
    print(e);
    print(st);
  }
  print("-----");
}

class InvalidAgeException implements Exception {
  final int age;
  final String message;

  InvalidAgeException(this.age, this.message);

  @override
  String toString() => 'InvalidAgeExceptino age: $age, message: $message';
}

class Person {
  final int age;

  Person({required this.age}) {
    if (age < 0) {
      throw InvalidAgeException(age, "age must be positive");
    } else if (age > 140) {
      throw InvalidAgeException(age, "age must be less than 140");
    }
  }
}
