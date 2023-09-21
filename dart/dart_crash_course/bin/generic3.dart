void main(List<String> args) {
  const momAndDad = {
    'mom': Person(),
    'dad': Person(),
  };
  const brotherAndSisterAndFish = {
    'brother': Person(),
    'sister': Person(),
    'fish': Fish(),
  };

  final allValues = [
    momAndDad,
    brotherAndSisterAndFish,
  ];

  describe(allValues);
}

//typedef BreathingThings = Map<String, CanBreathe>; or
typedef BreathingThings<T extends CanBreathe> = Map<String, T>;

void describe(Iterable<BreathingThings> values) {
  for (final map in values) {
    for (final keyAndValue in map.entries) {
      print("call breathe() on ${keyAndValue.key}");
      keyAndValue.value.breathe();
    }
  }
}

mixin CanBreathe {
  void breathe();
}

class Person with CanBreathe {
  const Person();

  @override
  void breathe() {
    print("Person is breathing");
  }
}

class Fish with CanBreathe {
  const Fish();

  @override
  void breathe() {
    print("Fish is breathing");
  }
}
