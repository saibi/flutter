void main(List<String> args) {}

abstract class Vehicle {
  final VehicleKind kind;

  Vehicle({
    required this.kind,
  });

  void accelerate() => print('$kind is accelerating');
  void decelerate() => print('$kind is decelerating');
}

enum VehicleKind {
  car,
  truck,
  motorcycle,
  bicycle,
}

class Car extends Vehicle {
  Car() : super(kind: VehicleKind.car);
}

class Motorcycle implements Vehicle {
  @override
  void accelerate() {
    print('Motorcycle is accelerating');
  }

  @override
  void decelerate() {
    print('Motorcycle is decelerating');
  }

  @override
  VehicleKind get kind => VehicleKind.motorcycle;
}
