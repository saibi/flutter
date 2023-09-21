void main(List<String> args) {
  const tuple = Tuple(1, "one");
  print(tuple);

  final swapped = tuple.swap();
  print(swapped);

  const v = Tuple(1, 1.1);
  print(v.sum);
}

class Tuple<L, R> {
  final L left;
  final R right;

  const Tuple(this.left, this.right);

  @override
  String toString() => 'Tuple, left = $left, right = $right';
}

// dynamic,dynamic
// extension on Tuple {
//   Tuple swap() => Tuple(right, left);
// }

// right, left
extension SwapOnTuple<L, R> on Tuple<L, R> {
  Tuple<R, L> swap() => Tuple(right, left);
}

extension<L extends num, R extends num> on Tuple<L, R> {
  num get sum => left + right;
}
