import 'dart:io';

void main(List<String> args) {
  do {
    stdout.write("enter your age or type exit:");
    final input = stdin.readLineSync();
    if (input == "exit") {
      break;
    } else if ((input?.length ?? 0) == 0 || input == null) {
      stdout.writeln("invalid input");
      continue;
    }
    print(input);
    final age = int.tryParse(input);
    if (age == null) {
      stdout.writeln("invalid age");
      continue;
    }
    print("your age is $age");
  } while (true);
}
