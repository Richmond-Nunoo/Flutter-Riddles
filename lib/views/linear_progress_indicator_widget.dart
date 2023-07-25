import 'dart:async';
import 'package:flashcards_quiz/views/quiz.dart';
import 'package:flutter/material.dart';

class MyProgressIndicator extends StatefulWidget {
  final List<dynamic> questionlenght;
  final dynamic optionsList;
  const MyProgressIndicator({
    super.key,
    required this.questionlenght,
    required this.optionsList,
  });

  @override
  State<MyProgressIndicator> createState() => _MyProgressIndicatorState();
}

class _MyProgressIndicatorState extends State<MyProgressIndicator> {
  int timerSeconds = 9;
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
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => QuizScreen(
              questionlenght: widget.questionlenght,
              optionsList: widget.optionsList,
            )));
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
          minHeight: 10,
          value: 1 - (timerSeconds / 9),
          backgroundColor: Colors.blue.shade100,
          color: Colors.blueGrey,
          valueColor: const AlwaysStoppedAnimation(bgColor),
        ),
      ),
    );
  }
}


// Map<WidgetQuestion, Option> getRandomQuestions(
//     List<WidgetQuestion> allQuestions, int count) {
//   if (count >= allQuestions.length) {
//     // If count is larger than the number of available questions, return all questions with their correct answers.
//     return {
//       for (var question in allQuestions)
//         question: question.options.firstWhere((option) => option.isCorrect)
//     };
//   }
//   final randomQuestions = <WidgetQuestion>[];
//   final randomAnswers = <Option>[];
//   List<int> indexes = List.generate(allQuestions.length, (index) => index);
//   final random = Random();
//   while (randomQuestions.length < count) {
//     final randomIndex = random.nextInt(indexes.length);
//     final selectedQuestionIndex = indexes[randomIndex];
//     final selectedQuestion = allQuestions[selectedQuestionIndex];
//     randomQuestions.add(selectedQuestion);
//     randomAnswers
//         .add(selectedQuestion.options.firstWhere((option) => option.isCorrect));
//     indexes.removeAt(randomIndex);
//   }
//   return Map.fromIterables(randomQuestions, randomAnswers);
// }
