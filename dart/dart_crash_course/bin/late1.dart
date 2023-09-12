void main(List<String> args) {
  print("before");
  late String name = provideName();
  print("after");

  final person = Person();
  print(person.age);
}

String provideName() {
  print("Function is called");
  return "foo bar";
}

class Person {
  late String description = heavyCalculationOfDescription();
  final int age;
  Person({this.age = 18}) {
    print("constructor is called");
  }
  String heavyCalculationOfDescription() {
    print("Function heavyCalculation is called");
    return "Foo Bar";
  }
}
