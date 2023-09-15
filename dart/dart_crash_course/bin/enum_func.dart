void main(List<String> args) {
  final pet = AnimalType.dog;

  pet
    ..run()
    ..jump();
}

enum AnimalType {
  dog,
  cat,

  rabbit;

  void run() {
    print("$this is running");
  }
}

extension Jump on AnimalType {
  void jump() {
    print("$this is jumping");
  }
}
