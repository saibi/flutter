void main(List<String> args) {
  final dad = FamilyMember(name: "dad");
  final mom = FamilyMember(name: "mom");

  final family = dad + mom;

  print(family);
}

class FamilyMember {
  final String name;

  const FamilyMember({required this.name});

  @override
  String toString() {
    return 'FamilyMember{name: $name}';
  }
}

class Family {
  final List<FamilyMember> members;

  const Family({required this.members});

  @override
  String toString() {
    return 'Family (members = $members)';
  }
}

extension ToFamily on FamilyMember {
  Family operator +(FamilyMember other) {
    return Family(members: [this, other]);
  }
}
