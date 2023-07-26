import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.score});
  final int score;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.popUntil(context, (route) => route.isFirst);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Results"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.close),
            )
          ],
        ),
        body: Center(
          child: Text("$score"),
        ),
      ),
    );
  }
}
