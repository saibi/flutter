void main(List<String> args) {
  print(getFullName(null, null));
  print(getFullName('John', null));
  print(getFullName(null, 'Doe'));
  print(getFullName('John', 'Doe'));

  String? firstName = 'John';
  String? lastName = 'Doe'; // null

  final bla = firstName.flatMap(
        (f) => lastName.flatMap(
          (l) => '$f $l',
        ),
      ) ??
      'Either first or last name or both are null';

  print(bla);

  print(fullName(null, null));
  print(fullName('John', null));
  print(fullName(null, 'Doe'));
  print(fullName('John', 'Doe'));
}

T? withAll<T>(
  List<T?> optionals,
  T Function(List<T>) callback,
) =>
    optionals.any((e) => e == null) ? null : callback(optionals.cast<T>());

String getFullName(String? firstName, String? lastName) =>
    withAll([firstName, lastName], (names) => names.join(' ')) ?? 'Empty';

extension FlatMap<T> on T? {
  R? flatMap<R>(
    R? Function(T) callback,
  ) {
    final shadow = this;
    if (shadow == null) {
      return null;
    } else {
      return callback(shadow);
    }
  }
}

String fullName(String? first, String? last) {
  return '${first.orDefault} ${last.orDefault}';
}

extension Defaultvalues<T> on T? {
  T get orDefault {
    final shadow = this;

    if (shadow != null) {
      return shadow;
    }
    switch (T) {
      case int:
        return 0 as T;
      case double:
        return 0.0 as T;
      case String:
        return '' as T;
      case bool:
        return false as T;
      default:
        throw Exception('No default value for type $T');
    }
  }
}
