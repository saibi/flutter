void main(List<String> args) {
  print(doTypesMatch(1, 2));
  print(doTypesMatch(1, 2.2));
  print(doTypesMatch(1, 'foo'));
  print(doTypesMatch('bar', 'foo'));

  print(doTypesMatch2(1, 2));
  print(doTypesMatch2(1, 2.2));
  print(doTypesMatch2(1, 'foo'));
  print(doTypesMatch2('bar', 'foo'));
}

bool doTypesMatch(Object a, Object b) {
  return a.runtimeType == b.runtimeType;
}

bool doTypesMatch2<T1, T2>(T1 a, T2 b) {
  return T1 == T2;
}
