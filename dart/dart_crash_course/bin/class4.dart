void main(List<String> args) {}

enum Role {
  mom,
  dad,
  son,
  daughter,
  grandpa,
  grandma,
}

class Person {
  final Role role;

  const Person({
    required this.role,
  });
}

class Mom extends Person {
  const Mom() : super(role: Role.mom);
}
