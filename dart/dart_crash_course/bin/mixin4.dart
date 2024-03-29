void main(List<String> args) {
  Human().run();
}

class Has2Feet {
  const Has2Feet();
}

mixin CanRun on Has2Feet {
  void run() {
    print('$runtimeType is running');
  }
}

class Human extends Has2Feet with CanRun {
  const Human();
}

class HasNoFeet {
  const HasNoFeet();
}

class Fish extends HasNoFeet {
  const Fish();
}
