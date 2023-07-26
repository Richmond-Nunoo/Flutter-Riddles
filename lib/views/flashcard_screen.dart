import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flashcards_quiz/widgets/flash_card_widget.dart';
import 'package:flashcards_quiz/widgets/linear_progress_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class NewCard extends StatefulWidget {
  final String topicName;
  final List<dynamic> typeOfTopic;
  const NewCard(
      {super.key, required this.topicName, required this.typeOfTopic});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  final AppinioSwiperController controller = AppinioSwiperController();

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF4993FA);
    const Color bgColor3 = Color(0xFF5170FD);

    // Get a list of 4 randomly selected WidgetQuestion objects
    Map<dynamic, dynamic> randomQuestionsMap =
        getRandomQuestionsAndOptions(widget.typeOfTopic, 4);

    List<dynamic> randomQuestions = randomQuestionsMap.keys.toList();
    dynamic randomOptions = randomQuestionsMap.values.toList();

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
                          ),
                        ),
                        MyProgressIndicator(
                          questionlenght: randomQuestions,
                          optionsList: randomOptions,
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
                  onSwipe: _swipe,
                  onEnd: _onEnd,
                  cardsCount: randomQuestions.length,
                  cardsBuilder: (BuildContext context, int index) {
                    var cardIndex = randomQuestions[index];
                    var optionsIndex = randomOptions[index];
                    print("1 ${optionsIndex}");
                    for (var option in optionsIndex) {
                      print("Option: ${option.text}, ");
                    }
                    return FlipCardsWidget(
                      bgColor: bgColor,
                      cardsLenght: randomQuestions.length,
                      currentIndex: index + 1,
                      answer: cardIndex.correctAnswer.text,
                      question: cardIndex.text,
                      currentTopic: widget.topicName,
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
                    Size(MediaQuery.sizeOf(context).width * 0.75, 40),
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

Map<dynamic, dynamic> getRandomQuestionsAndOptions(
  List<dynamic> allQuestions,
  int count,
) {
  final randomQuestions = <dynamic>[];
  final randomOptions = <dynamic>[];
  final random = Random();

  if (count >= allQuestions.length) {
    count = allQuestions.length;
  }

  while (randomQuestions.length < count) {
    final randomIndex = random.nextInt(allQuestions.length);
    final selectedQuestion = allQuestions[randomIndex];

    if (!randomQuestions.contains(selectedQuestion)) {
      randomQuestions.add(selectedQuestion);
      randomOptions.add(selectedQuestion.options);
    }
  }

  return Map.fromIterables(randomQuestions, randomOptions);
}

// List<dynamic> getRandomQuestions(List<dynamic> allQuestions, int count) {
//   if (count >= allQuestions.length) {
//     return List.from(allQuestions);
//   }
//   List<dynamic> randomQuestions = [];

//   List<int> indexes = List.generate(allQuestions.length, (index) => index);
//   final random = Random();

//   while (randomQuestions.length < count) {
//     final randomIndex = random.nextInt(indexes.length);
//     final selectedQuestionIndex = indexes[randomIndex];
//     final selectedQuestion = allQuestions[selectedQuestionIndex];
//     randomQuestions.add(selectedQuestion);

//     indexes.removeAt(randomIndex);
//   }
//   return randomQuestions;
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
