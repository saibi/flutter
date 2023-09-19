void main(List<String> args) {
  final person = Person();
  person.jump(speed: 10);
  person.walk(speed: 5);
}

mixin HasSpeed {
  abstract double speed;
}

mixin CanJump on HasSpeed {
  void jump({
    required double speed,
  }) {
    print('$runtimeType is jumping at the speed of $speed');
    this.speed = speed;
  }
}

mixin CanWalk on HasSpeed {
  void walk({
    required double speed,
  }) {
    print('$runtimeType is walk at the speed of $speed');
    this.speed = speed;
  }
}

class Person with HasSpeed, CanWalk, CanJump {
  @override
  double speed;

  Person() : speed = 0.0;
}
