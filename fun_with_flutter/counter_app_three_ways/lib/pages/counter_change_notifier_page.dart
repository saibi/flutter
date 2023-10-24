import 'package:counter_app_three_ways/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _counterProvider = ChangeNotifierProvider<CounterChangeNotifier>(
    (ref) => CounterChangeNotifier());

class CounterchangeNotifierPage extends ConsumerWidget {
  const CounterchangeNotifierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(_counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Page'),
      ),
      body: Center(
        child: Text('Count: ${counter.count}'),
      ),
      floatingActionButton: const MyFloatingButton(),
    );
  }
}

class MyFloatingButton extends ConsumerWidget {
  const MyFloatingButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(_counterProvider).increment();
      },
      child: const Icon(Icons.add),
    );
  }
}
