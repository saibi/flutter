void main(List<String> args) {
  describe(animalType(fromStr: "rabbit"));
  describe(animalType(fromStr: "dog"));
  describe(animalType(fromStr: "cat"));
  describe(animalType(fromStr: "horse"));
}

void describe(AnimalType? animalType) {
  switch (animalType) {
    case AnimalType.rabbit:
      print("this is a rabiit");
    case AnimalType.dog:
      print("this is a dog");
    case AnimalType.cat:
      print("this is a cat");
    default:
      print("unknown");
  }
}

AnimalType? animalType({
  required String fromStr,
}) {
  try {
    return AnimalType.values.firstWhere((element) => element.name == fromStr);
  } catch (e) {
    return null;
  }
}

enum AnimalType {
  rabbit,
  dog,
  cat,
}
