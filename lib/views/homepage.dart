import 'package:flashcards_quiz/views/flash_cards.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Begining of a legend"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyCustomWidget(),
              ),
            );
          },
          child: const Text("Flash Cards"),
        ),
      ),
    );
  }
}
