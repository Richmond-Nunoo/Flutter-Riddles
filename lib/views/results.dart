import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Results"),
        centerTitle: true,
      ),
      body:const Center(
        child: Text("Results"),
      ),
    );
  }
}
