void main(List<String> args) {
  const info = {
    "name": "John",
    "age": 30,
    "height": 1.8,
    "isMarried": false,
    "address": {
      "street": "Main Stree",
      "city": "New York",
      "country": "USA",
    }
  };

  for (final entry in info.entries) {
    print("${entry.key} : ${entry.value}");
  }
}
