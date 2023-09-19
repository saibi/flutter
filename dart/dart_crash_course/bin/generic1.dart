void main(List<String> args) {
  final doubleValue = eitherIntOrDouble(WhatToReturn.double);
  print(doubleValue);

  final double doubleValue2 = eitherIntOrDouble2();
  print(doubleValue2);

  final value = eitherIntOrDouble2<int>();
  print(value);
}

enum WhatToReturn {
  int,
  double;
}

num eitherIntOrDouble(WhatToReturn whatToReturn) {
  switch (whatToReturn) {
    case WhatToReturn.int:
      return 1;

    case WhatToReturn.double:
      return 1.0;
  }
}

SOMETHING eitherIntOrDouble2<SOMETHING extends num>() {
  switch (SOMETHING) {
    case int:
      return 1 as SOMETHING;
    case double:
      return 1.0 as SOMETHING;
    default:
      throw Exception('not supported');
  }
}
