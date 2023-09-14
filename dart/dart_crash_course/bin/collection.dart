import 'package:collection/collection.dart';

void main(List<String> args) {
  final boolList = BoolList(
    10,
    growable: true,
  );
  print(boolList);
  print("-------");

  final info = {
    'name': 'john',
    'age': 30,
    'sex': 'male',
    'address': 'newyork',
  };

  final canonicalMap = CanonicalizedMap.from(info, (key) {
    return key.length;
  });

  print(canonicalMap);
  print("-------");

  final one = [1, 2, 3];
  final two = [10, 20, 30];
  final three = [40, 50, 60];

  var combined = CombinedIterableView([one, two, three]);

  print(combined);
  two.add(33);
  print(combined);

  print("-------");

  final swedishNames = ['sven', 'karl', 'gustav'];
  final norwegianNames = ['sven', 'karl', 'ole'];
  final frenchNames = ['sven', 'karl', 'pierre'];

  final combinedNames = CombinedListView([
    swedishNames,
    norwegianNames,
    frenchNames,
  ]);

  swedishNames.removeAt(0);
  print(combinedNames);
}
