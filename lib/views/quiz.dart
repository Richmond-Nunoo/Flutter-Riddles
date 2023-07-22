import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.popUntil(context, (route) => route.isFirst);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz Start"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: const Center(
          child: Text("Quiz"),
        ),
      ),
    );
  }
}
