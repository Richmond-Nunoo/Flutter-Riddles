import 'dart:async';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flashcards_quiz/views/homepage.dart';
import 'package:flashcards_quiz/views/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyCustomWidget extends StatefulWidget {
  final String topicName;
  final List<dynamic> typeOfTopic;
  const MyCustomWidget({super.key, required this.typeOfTopic, required this.topicName});

  @override
  MyCustomWidgetState createState() => MyCustomWidgetState();
}

class MyCustomWidgetState extends State<MyCustomWidget> {
  final AppinioSwiperController controller = AppinioSwiperController();

  int _timerSeconds = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    //   startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerSeconds > 0) {
          _timerSeconds--;
        } else {
          // Timer expired, navigate to the new screen
          _timer?.cancel();
          navigateToNewScreen();
        }
      });
    });
  }

  void navigateToNewScreen() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const QuizScreen()));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF4993FA);
    const Color bgColor3 = Color(0xFF5170FD);

    final randomQuestions = getRandomQuestions(widget.typeOfTopic, 4);

    // Get a list of 3 randomly selected WidgetQuestion objects
    // Map<WidgetQuestion, Option> randomQuestionsMap =
    //     getRandomQuestions(widgetQuestionsList, 4);

    // List<WidgetQuestion> randomQuestions = randomQuestionsMap.keys.toList();
    // List<Option> correctAnswers = randomQuestionsMap.values.toList();

    return Scaffold(
      backgroundColor: bgColor3,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              CupertinoIcons.clear,
                              color: Colors.white,
                              weight: 10,
                            )),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: LinearProgressIndicator(
                              minHeight: 10,
                              value: 1 - (_timerSeconds / 60),
                              backgroundColor: Colors.blue.shade100,
                              color: Colors.blueGrey,
                              valueColor: const AlwaysStoppedAnimation(bgColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.60,
                child: AppinioSwiper(
                  loop: true,
                  backgroundCardsCount: 1,
                  swipeOptions: const AppinioSwipeOptions.all(),
                  unlimitedUnswipe: true,
                  controller: controller,
                  unswipe: _unswipe,
                  onSwiping: (AppinioSwiperDirection direction) {
                    print("${direction.index}");
                    debugPrint(direction.toString());
                  },
                  onSwipe: _swipe,
                  onEnd: _onEnd,
                  cardsCount: randomQuestions.length,
                  cardsBuilder: (BuildContext context, int index) {
                    var cardIndex = randomQuestions[index];
                    return FlipCardsWidget(
                      bgColor: bgColor,
                      cardsLenght: randomQuestions.length,
                      currentIndex: index + 1,
                      answer: cardIndex.correctAnswer.text,
                      question: cardIndex.text, currentTopic: widget.topicName,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                  child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width * 0.75, 40),
                  ),
                  elevation: MaterialStateProperty.all(1),
                ),
                onPressed: () => controller.unswipe(),
                child: const Text(
                  "Reset Card",
                  style: TextStyle(
                    color: bgColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

List<dynamic> getRandomQuestions(List<dynamic> allQuestions, int count) {
  if (count >= allQuestions.length) {
    return List.from(allQuestions);
  }
  List<dynamic> randomQuestions = [];

  List<int> indexes = List.generate(allQuestions.length, (index) => index);
  final random = Random();

  while (randomQuestions.length < count) {
    final randomIndex = random.nextInt(indexes.length);
    final selectedQuestionIndex = indexes[randomIndex];
    final selectedQuestion = allQuestions[selectedQuestionIndex];
    randomQuestions.add(selectedQuestion);

    indexes.removeAt(randomIndex);
  }
  return randomQuestions;
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

void _swipe(int index, AppinioSwiperDirection direction) {
  print("the card was swiped to the: ${direction.name}");
  print(index);
}

void _unswipe(bool unswiped) {
  if (unswiped) {
    print("SUCCESS: card was unswiped");
  } else {
    print("FAIL: no card left to unswipe");
  }
}

void _onEnd() {
  print("end reached!");
}
