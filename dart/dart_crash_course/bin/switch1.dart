void main(List<String> args) {
  describe(1);
  describe(1.1);
  describe("1.1");
  describe(true);
  describe({"key": "value"});
  describe([1, 2, 3, 4]);
}

void describe<T>(T value) {
  switch (T) {
    case int:
      print("int");
      break;
    case double:
      print("double");
      break;
    case String:
      print("string");
      break;
    case bool:
      print("bool");
      break;
    case const (Map<String, String>):
      print("map");
      break;
    default:
      print("something else");
  }
}
