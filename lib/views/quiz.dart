import 'package:flashcards_quiz/views/results.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final List<dynamic> questionlenght;
  final List optionsList;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  itemBuilder: (context, index) {
                    final myquestions = widget.questionlenght[index];

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
                              var option = myquestions.options[index];
                              var color = Colors.grey.shade200;

                              // Check if the tapped option is correct or incorrect
                              if (myquestions.isLocked) {
                                if (option ==
                                    myquestions.selectedWiidgetOption) {
                                  color = option.isCorrect
                                      ? Colors.green
                                      : Colors.red;
                                } else if (option.isCorrect) {
                                  color = Colors.green;
                                }
                              }

                              return InkWell(
                                onTap: () {
                                  // Perform any logic you need when an option is tapped
                                  if (!myquestions.isLocked) {
                                    setState(() {
                                      myquestions.isLocked = true;
                                      myquestions.selectedWiidgetOption =
                                          option;
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
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.brown),
                                    color: color,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        option.text,
                                        style: const TextStyle(fontSize: 16),
                                      ),
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
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        if (_questionNumber < widget.questionlenght.length) {
          _controller.nextPage(
            duration: const Duration(milliseconds: 250),
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
