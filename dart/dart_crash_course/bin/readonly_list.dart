import 'dart:collection';

void main(List<String> args) {
  final names = ["john", "jane"];

  names.add('jack');
  print(names);

  final readonly = UnmodifiableListView(names);
  try {
    readonly.add('jjj');
  } catch (e) {
    print(e);
  }
}
