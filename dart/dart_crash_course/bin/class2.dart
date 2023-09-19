void main(List<String> args) {
  final car = Car();

  car.drive(speed: 10);
  car.speed = 20;
  //car.speed(20);
}

class Car {
  int _speed = 0;

  int get speed => _speed;
  set speed(int newSpeed) {
    if (newSpeed < 0) {
      throw Exception('Speed cannot be negative');
    } else {
      _speed = newSpeed;
    }
  }

  void drive({
    required int speed,
  }) {
    this.speed = speed;
    print("Accelerating to $speed km/h");
  }
}
