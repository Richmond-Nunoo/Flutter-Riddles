import 'dart:async';
import 'package:flashcards_quiz/views/quiz_screen.dart';
import 'package:flutter/material.dart';

class MyProgressIndicator extends StatefulWidget {
  final List<dynamic> questionlenght;
  final dynamic optionsList;
  final String topicType;
  const MyProgressIndicator({
    super.key,
    required this.questionlenght,
    required this.optionsList,
    required this.topicType,
  });

  @override
  State<MyProgressIndicator> createState() => _MyProgressIndicatorState();
}

class _MyProgressIndicatorState extends State<MyProgressIndicator> {
  int timerSeconds = 45;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timerSeconds > 0) {
          timerSeconds--;
        } else {
          _timer?.cancel();
          navigateToNewScreen();
        }
      });
    });
  }

  void navigateToNewScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => QuizScreen(
          questionlenght: widget.questionlenght,
          optionsList: widget.optionsList,
          topicType: widget.topicType,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF4993FA);
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: LinearProgressIndicator(
          minHeight: 20,
          value: 1 - (timerSeconds / 45),
          backgroundColor: Colors.blue.shade100,
          color: Colors.blueGrey,
          valueColor: const AlwaysStoppedAnimation(bgColor),
        ),
      ),
    );
  }
}
