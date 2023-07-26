import 'dart:async';

import 'package:flashcards_quiz/views/results_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final String topicType;
  final List<dynamic> questionlenght;
  final dynamic optionsList;
  const QuizScreen(
      {super.key,
      required this.questionlenght,
      required this.optionsList,
      required this.topicType});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionTimerSeconds = 10;
  Timer? _timer;
  int _questionNumber = 1;
  PageController _controller = PageController();
  int score = 0;
  bool isLocked = false;

  void startTimerOnQuestions() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (questionTimerSeconds > 0) {
            questionTimerSeconds--;
          } else {
            _timer?.cancel();
            navigateToNewScreen();
          }
        });
      }
    });
  }

  void stopTime() {
    _timer?.cancel();
  }

  void navigateToNewScreen() {
    if (_questionNumber < widget.questionlenght.length) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      setState(() {
        _questionNumber++;
        isLocked = false;
      });
      _resetQuestionLocks();
      startTimerOnQuestions();
    } else {
      _timer?.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(score: score),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _resetQuestionLocks();
    startTimerOnQuestions();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color bgColor3 = Color(0xFF5170FD);
    const Color bgColor = Color(0xFF4993FA);

    return WillPopScope(
      onWillPop: () {
        Navigator.popUntil(context, (route) => route.isFirst);
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: bgColor3,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                "${widget.topicType} Riddles",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
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
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: LinearProgressIndicator(
                            minHeight: 20,
                            value: 1 - (questionTimerSeconds / 10),
                            backgroundColor: Colors.blue.shade100,
                            color: Colors.blueGrey,
                            valueColor: const AlwaysStoppedAnimation(bgColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.24),
                            blurRadius: 20.0,
                            offset: const Offset(0.0, 10.0),
                            spreadRadius: 10,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Question $_questionNumber/${widget.questionlenght.length}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              Expanded(
                                child: PageView.builder(
                                  controller: _controller,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: widget.questionlenght.length,
                                  onPageChanged: (value) {
                                    setState(() {
                                      _questionNumber = value + 1;
                                      isLocked = false;
                                      _resetQuestionLocks();
                                    });
                                  },
                                  itemBuilder: (context, index) {
                                    final myquestions =
                                        widget.questionlenght[index];
                                    var optionsIndex =
                                        widget.optionsList[index];

                                    return Column(
                                      children: [
                                        const SizedBox(
                                          height: 32,
                                        ),
                                        Text(
                                          myquestions.text,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 32,
                                        ),
                                        Expanded(
                                          child: ListView.builder(
                                            itemCount:
                                                myquestions.options.length,
                                            itemBuilder: (context, index) {
                                              var color = Colors.grey.shade200;

                                              var questionOption =
                                                  myquestions.options[index];

                                              if (myquestions.isLocked) {
                                                if (questionOption ==
                                                    myquestions
                                                        .selectedWiidgetOption) {
                                                  color =
                                                      questionOption.isCorrect
                                                          ? Colors.green
                                                          : Colors.red;
                                                } else if (questionOption
                                                    .isCorrect) {
                                                  color = Colors.green;
                                                }
                                              }
                                              return InkWell(
                                                onTap: () {
                                                  stopTime();
                                                  if (!myquestions.isLocked) {
                                                    setState(() {
                                                      myquestions.isLocked =
                                                          true;
                                                      myquestions
                                                              .selectedWiidgetOption =
                                                          questionOption;
                                                    });

                                                    isLocked =
                                                        myquestions.isLocked;
                                                    if (myquestions
                                                        .selectedWiidgetOption
                                                        .isCorrect) {
                                                      score++;
                                                    }
                                                  }
                                                },
                                                child: Container(
                                                  height: 50,
                                                  padding:
                                                      const EdgeInsets.all(14),
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: color),
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        questionOption.text,
                                                        style: const TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                      isLocked == true
                                                          ? questionOption
                                                                  .isCorrect
                                                              ? const Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color: Colors
                                                                      .green,
                                                                )
                                                              : const Icon(
                                                                  Icons.cancel,
                                                                  color: Colors
                                                                      .red,
                                                                )
                                                          : const SizedBox
                                                              .shrink()
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              isLocked
                                  ? buildElevatedButton()
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _resetQuestionLocks() {
    for (var question in widget.questionlenght) {
      question.isLocked = false;
    }
    questionTimerSeconds = 10;
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        if (_questionNumber < widget.questionlenght.length) {
          _controller.nextPage(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
          setState(() {
            _questionNumber++;
            isLocked = false;
          });
          _resetQuestionLocks();
          startTimerOnQuestions();
        } else {
          _timer?.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsScreen(score: score),
            ),
          );
        }
      },
      child: Text(
        _questionNumber < widget.questionlenght.length
            ? 'Next Page'
            : 'See the Result',
      ),
    );
  }
}
