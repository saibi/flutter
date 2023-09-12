void main(List<String> args) {
  int? age;

  age ??= 18; // assign 18 only if age is null
  print(age);

  String? nullName;

  print(nullName ??
      'Foo'); // if nullName is not null use left or is null use right

  List<String> a = [];

  print(a);

  String? lastName;

  //lastName = 'Bar';

  if (lastName?.contains('Bar') ?? false) {
    print('lastName contains bar');
  }
  if (lastName?.contains('Bar') == true) {
    print('lastName contains bar');
  }

  String? getFullNameOptional() {
    return null;
    //return 'foo';
  }

  final someName = getFullNameOptional();
  someName.describe();
}

extension Describe on Object? {
  void describe() {
    if (this == null) {
      print('This object is null');
    } else {
      print('$runtimeType: $this');
    }
  }
}
