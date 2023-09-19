void main(List<String> args) {
  final foo = Person(firstName: 'foo', lastName: 'bar');

  print(foo.fullName);
}

class Person {
  final String firstName;
  final String lastName;

  String get fullName => '$firstName $lastName';

  const Person({
    required this.firstName,
    required this.lastName,
  });
}

// class Person {
//   final String firstName;
//   final String lastName;
//   final String fullName;

//   const Person({
//     required this.firstName,
//     required this.lastName,
//   }) : fullName = '$firstName $lastName';
// }


// class Person {
//   final String name;
//   final int age;

//   const Person({
//     required this.name,
//     required this.age,
//   });
// }
