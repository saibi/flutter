const json = {
  'name': 'foo bar',
  'age': 20,
};
void main(List<String> args) {
  // final map = {
  //   'Name': 'foo',
  //   'Age': 18,
  // };

  final String? ageAsString = json.find<int>(
    'age',
    (int age) => age.toString(),
  );
  print(ageAsString);

  final String helloName =
      json.find<String>('name', (String name) => 'Hello, $name !!!')!;
  print(helloName);
}

extension Find<K, V, R> on Map<K, V> {
  R? find<T>(
    K key,
    R? Function(T value) cast,
  ) {
    final value = this[key];
    if (value != null && value is T) {
      return cast(value as T);
    } else {
      return null;
    }
  }
}
