import 'package:flutter/material.dart';
import 'package:splash/models/character_model.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  List<MarioCharacter> characters = [];

  @override
  void initState() {
    super.initState();
    MarioCharacter.fetchAll().then((data) {
      setState(() {
        characters = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Super Mario Characters'),
      ),
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(characters[index].name),
            subtitle: Text(characters[index].purpose),
            trailing: Icon(
              characters[index].isEnemy ? Icons.thumb_down : Icons.thumb_up,
              color: characters[index].isEnemy ? Colors.red : Colors.green,
            ),
          );
        },
      ),
    );
  }
}
