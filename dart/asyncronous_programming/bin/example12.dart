import 'dart:async';

void main(List<String> args) async {
  await for (final name in getNames().absorbErrorsUsingHandleError()) {
    print(name);
  }
  print("-----");
  await for (final name in getNames().absorbErrorsUsingHandlers()) {
    print(name);
  }
  print("-----");
  await for (final name in getNames().absorbErrorsUsingTransformer()) {
    print(name);
  }
}

extension AbsorbErrors<T> on Stream<T> {
  Stream<T> absorbErrorsUsingHandleError() => handleError(
        (_, __) {},
      );

  Stream<T> absorbErrorsUsingHandlers() =>
      transform(StreamTransformer.fromHandlers(
        handleError: (_, __, sink) => sink.close(),
      ));

  Stream<T> absorbErrorsUsingTransformer() => transform(
        StreamErrorAbsorber(),
      );
}

Stream<String> getNames() async* {
  yield 'John';
  await Future.delayed(Duration(milliseconds: 300));
  yield 'Jane';
  await Future.delayed(Duration(milliseconds: 300));
  throw 'All out of names';
}

class StreamErrorAbsorber<T> extends StreamTransformerBase<T, T> {
  @override
  Stream<T> bind(Stream<T> stream) {
    final controller = StreamController<T>();
    stream.listen(
      controller.sink.add,
      onError: (_) {},
      onDone: controller.close,
    );
    return controller.stream;
  }
}
