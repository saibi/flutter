void main(List<String> args) {
  final pet = AnimalType.dog;

  if (pet == AnimalType.dog) {
    print("dog");
  } else {
    print("not a dog");
  }

  // switch (pet) {
  //   case AnimalType.dog:
  //   // TODO: Handle this case.
  //   case AnimalType.cat:
  //   // TODO: Handle this case.
  // }
}

enum AnimalType {
  dog,
  cat,
  monkey,
}
