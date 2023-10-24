import 'package:counter_app_three_ways/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _counterProvider = StateNotifierProvider<CounterStateNotifier, Counter>(
    (ref) => CounterStateNotifier());

class CounterStateNotifierPage extends ConsumerWidget {
  const CounterStateNotifierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(_counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Page'),
      ),
      body: Center(child: Text('Count: ${counter.count}')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(_counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
