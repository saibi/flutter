void main(List<String> args) {
  final johnDoe = Person(
    firstName: 'John',
    lastName: 'Doe',
  );

  print(johnDoe.fullName);
  print(getFullName(johnDoe));
}

String getFullName(HasFullName obj) => obj.fullName;

mixin HasFirstName {
  String get firstName;
}
mixin HasLastName {
  String get lastName;
}

mixin HasFullName on HasFirstName, HasLastName {
  String get fullName => '$firstName $lastName';
}

class Person with HasFirstName, HasLastName, HasFullName {
  @override
  String firstName;

  @override
  String lastName;

  Person({
    required this.firstName,
    required this.lastName,
  });
}
