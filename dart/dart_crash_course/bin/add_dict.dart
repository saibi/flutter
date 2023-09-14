void main(List<String> args) {
  addDict();
}

void addDict() {
  const info = {
    "name": "kim",
    "age": 18,
  };
  // final info2 = info;
  // info2.addAll({"height: 170"});

  final info2 = {...info}..addAll({"height": 170});
  print(info2);
}
