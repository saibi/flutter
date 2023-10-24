import 'package:counter_app_three_ways/pages/counter_change_notifier_page.dart';
import 'package:counter_app_three_ways/pages/counter_state_notifier_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const changeNotifierRoute = 'changeNotifier';
const stateNotifierRoute = 'stateNotifier';
const stateProviderRoute = 'stateProvider';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(title: 'Material App', initialRoute: '/', routes: {
        '/': (context) => const Home(),
        changeNotifierRoute: (context) => const CounterchangeNotifierPage(),
        stateNotifierRoute: (context) => const CounterStateNotifierPage(),
        stateProviderRoute: (context) => const Home(),
      }),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, changeNotifierRoute);
              },
              child: const Text('Change Notifier'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, stateNotifierRoute);
              },
              child: const Text('State Notifier'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, stateProviderRoute);
              },
              child: const Text('State Provider'),
            ),
          ],
        ),
      ),
    );
  }
}
