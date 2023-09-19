void main(List<String> args) {
  final mom = Person(name: 'jane');
  final dad = Person(name: 'john');
  final son = Person(name: 'jack');
  final daughter = Person(name: 'jill');
  final whisker = Pet(name: 'whisker');

  final family = mom + dad;
  print(family);

  final withWhisker = family & whisker;
  print(withWhisker);

  final withSon = withWhisker + son;
  print(withSon);
}

class Person {
  final String name;

  Person({required this.name});

  @override
  String toString() => 'Person $name';
}

class Pet {
  final String name;

  Pet({required this.name});

  @override
  String toString() => 'Pet $name';
}

class Family {
  final List<Person> members;
  final List<Pet> pets;

  Family({required this.members, required this.pets});

  @override
  String toString() => 'Family member=$members, pets=$pets';
}

extension on Person {
  Family operator +(Person other) => Family(members: [this, other], pets: []);
  Family operator &(Pet other) => Family(members: [this], pets: [other]);
}

extension on Family {
  Family operator &(Pet other) => Family(
        members: members,
        pets: [
          ...pets,
          other,
        ],
      );

  Family operator +(Person other) => Family(
        members: [
          ...members,
          other,
        ],
        pets: pets,
      );

  Family operator ^(Family other) => Family(
        members: [
          ...members,
          ...other.members,
        ],
        pets: [
          ...pets,
          ...other.pets,
        ],
      );
}
