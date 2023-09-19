import 'package:flutter/material.dart';
import 'package:splash/models/test_model.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<TestModel> characters = [];

  @override
  void initState() {
    super.initState();
    TestModel.fetchAll().then((data) {
      setState(() {
        characters = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sheet API Service Test'),
      ),
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(characters[index].name),
            subtitle: Text(characters[index].description),
            trailing: const Icon(
              Icons.thumb_up,
              color: Colors.green,
            ),
          );
        },
      ),
    );
  }
}
