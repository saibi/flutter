void main(List<String> args) {
  final johnDoe = Person(name: "John Doe");
  final janeDoe = Person(name: "Jane Doe");
  final doeFamily = WrongFamily(members: [johnDoe, janeDoe]);
  final doeFamilyOK = Family(members: [johnDoe, janeDoe]);
}

class Person {
  final String name;

  Person({required this.name});
}

class WrongFamily {
  final Iterable<Person> members;
  late int membersCount;

  WrongFamily({required this.members}) {
    membersCount =
        getMembersCount(); // late membersCount is evaluated in constructor
  }

  int getMembersCount() {
    print("getMembersCount is called");
    return members.length;
  }
}

class Family {
  final Iterable<Person> members;
  late int membersCount = getMembersCount();

  Family({required this.members});

  int getMembersCount() {
    print("getMembersCount is called");
    return members.length;
  }
}
