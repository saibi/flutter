import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

extension OptionalInfixAddition<T extends num> on T? {
  T? operator +(T? other) {
    final shadow = this;
    if (shadow != null) {
      return shadow + (other ?? 0) as T;
    } else {
      return null;
    }
  }
}

/*
void testIntAddition() {
  final int? nullerbleInt = 1;
  final int onlyInt = 1;

  //final result = nullerbleInt + onlyInt; // The operator '+' can't be unconditionally invoked because the receiver can be 'null'.
  final result = (nullerbleInt ?? 0) + onlyInt;  // use ?? to avoid null
  print(result);
}

OptionalInfixAddition enables you to use the + operator on nullable types. : final result = nullerbleInt + onlyInt;
*/

class Counter extends StateNotifier<int?> {
  Counter() : super(null);
  void increment() {
    state =
        state == null ? 1 : state + 1; // need OptionalInfixAddition extension
  }
}

final counterProvider =
    StateNotifierProvider<Counter, int?>((ref) => Counter());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(builder: (context, ref, child) {
          final counter = ref.watch(counterProvider);
          final text = counter == null ? 'Press the button' : '$counter';
          return Text(text);
        }),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: () {
              ref
                  .read(counterProvider.notifier)
                  .increment(); // ref.read read snapshot of notifier
            },
            child: const Text('increment counter'),
          ),
        ],
      ),
    );
  }
}
