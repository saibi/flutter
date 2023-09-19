void main(List<String> args) {
  final value = 20;

  print(value.timesFour);
  print(10.timesFour);

  print("abc".reversed);
}

extension on int {
  int get timesFour {
    return this * 4;
  }
}

extension on String {
  String get reversed => split('').reversed.join();
}
