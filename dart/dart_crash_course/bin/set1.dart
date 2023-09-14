import 'package:collection/collection.dart';

void main(List<String> args) {
  final names = {
    "Foo",
    "Bar",
    "Baz",
    "Qux",
  };

  names.add("Foo");

  print(names);

  final names2 = [
    "Foo",
    "Bar",
    "Baz",
    "Foo",
  ];
  print(names2);
  //final unique = {names2};
  final unique = {...names2}; // use spread operator to remove duplicates
  print(unique.toList());

  print("-----");
  final names3 = ["foo", "bar"];
  final names4 = ["foo", "bar"];

  if (names3 == names4) {
    print("names are equal");
  } else {
    print("not equal");
  }

  print("-----");
  const names5 = ["foo", "bar"];
  const names6 = ["foo", "bar"];
  if (names5 == names6) {
    print("names are equal");
  } else {
    print("not equal");
  }

  print("-----");
  final foo1 = "foo";
  var foo2 = "foo";
  print(foo1.hashCode);
  print(foo2.hashCode);

  print("-----");
  final ages1 = {20, 30, 40};
  final ages2 = {20, 30, 40};
  // print(ages1.hashCode);
  // print(ages2.hashCode);

  if (ages1 == ages2) {
    print("ages are equal");
  } else {
    print("not equal");
  }

  // use package:collection SetEquality()
  if (SetEquality().equals(ages1, ages1)) {
    print("ages are equal");
  } else {
    print("not equal");
  }

  // print("-----");
  // final ages3 = [20, 30, 40];
  // final ages4 = [20, 30, 40];
  // if (ages3 == ages4) {
  //   print("ages are equal");
  // } else {
  //   print("not equal");
  // }
}
