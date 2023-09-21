void main(List<String> args) {
  const one = KeyValue(1, 1);
  print(one);

  const two = KeyValue("two", 2);
  print(two);

  const KeyValue three = KeyValue(3, 3);
  print(three);
}

typedef KeyValue<K, V> = MapEntry<K, V>;
