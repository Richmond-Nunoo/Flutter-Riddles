import 'package:flashcards_quiz/views/results_screen.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final List<dynamic> questionlenght;
  final dynamic optionsList;
  const QuizScreen(
      {super.key, required this.questionlenght, required this.optionsList});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionNumber = 1;
  PageController _controller = PageController();
  int score = 0;
  bool isLocked = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _resetQuestionLocks();
  }

  @override
  Widget build(BuildContext context) {
   // const Color bgColor3 = Color(0xFF5170FD);
    return WillPopScope(
      onWillPop: () {
        Navigator.popUntil(context, (route) => route.isFirst);
        return Future.value(false);
      },
      child: Scaffold(
        //  backgroundColor: bgColor3,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Question $_questionNumber/${widget.questionlenght.length}",
                  style: const TextStyle(fontSize: 24),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
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
                      final myquestions = widget.questionlenght[index];
                      var optionsIndex = widget.optionsList[index];

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
                              itemCount: myquestions.options.length,
                              itemBuilder: (context, index) {
                                var color = Colors.grey.shade200;

                                var questionOption = myquestions.options[index];

                                if (myquestions.isLocked) {
                                  if (questionOption ==
                                      myquestions.selectedWiidgetOption) {
                                    color = questionOption.isCorrect
                                        ? Colors.green
                                        : Colors.red;
                                  } else if (questionOption.isCorrect) {
                                    color = Colors.green;
                                  }
                                }
                                return InkWell(
                                  onTap: () {
                                    for (var option in optionsIndex) {
                                      print("Option: ${option.text}, ");
                                    }
                                    if (!myquestions.isLocked) {
                                      setState(() {
                                        myquestions.isLocked = true;
                                        myquestions.selectedWiidgetOption =
                                            questionOption;
                                      });

                                      isLocked = myquestions.isLocked;
                                      if (myquestions
                                          .selectedWiidgetOption.isCorrect) {
                                        score++;
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    padding: const EdgeInsets.all(14),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: color),
                                      color: Colors.grey.shade200,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          questionOption.text,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        isLocked == true
                                            ? questionOption.isCorrect
                                                ? const Icon(
                                                    Icons.check_circle,
                                                    color: Colors.green,
                                                  )
                                                : const Icon(
                                                    Icons.cancel,
                                                    color: Colors.red,
                                                  )
                                            : const SizedBox.shrink()
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
                isLocked ? buildElevatedButton() : const SizedBox.shrink(),
              ],
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
        } else {
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
