void main(List<String> args) {
  const json = {
    'name': 'john',
    'age': 30,
  };
  print(json);

  // const JSON<int> json2 = {
  //   'name': 'john',
  //   'age': 30,
  // };

  const JSON<String> json3 = {
    'name': 'john',
    'age': "30",
  };
  print(json3);
}

typedef JSON<T> = Map<String, T>;
