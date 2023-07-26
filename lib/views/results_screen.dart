import 'package:flashcards_quiz/widgets/dotted_lines.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.score, required this.totalQuestions});
  final int score;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    const Color bgColor3 = Color(0xFF5170FD);
    print(score);
    print(totalQuestions);
    final double percentageScore = (score / totalQuestions) * 100;
    final int roundedPercentageScore = percentageScore.round();
    return WillPopScope(
      onWillPop: () {
        Navigator.popUntil(context, (route) => route.isFirst);
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: bgColor3,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Results On Your ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.white, fontSize: 20),
                        ),
                        for (var i = 0; i < "Riddles!!!".length; i++) ...[
                          TextSpan(
                            text: "Riddles!!!"[i],
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 21 + i.toDouble(),
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: MediaQuery.of(context).size.height * 0.56,
                  child: Stack(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Column(
                          children: [
                            const Expanded(
                                child: Center(
                              child: Text("1"),
                            )),
                            CustomPaint(
                              painter: DrawDottedhorizontalline(),
                            ),
                            const Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text("2"),
                                ))
                          ],
                        ),
                      ),
                      Positioned(
                        left: -10,
                        top: MediaQuery.of(context).size.height * 0.175,
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                              color: bgColor3, shape: BoxShape.circle),
                        ),
                      ),
                      Positioned(
                        right: -10,
                        top: MediaQuery.of(context).size.height * 0.175,
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                              color: bgColor3, shape: BoxShape.circle),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    fixedSize: MaterialStateProperty.all(
                      Size(MediaQuery.sizeOf(context).width * 0.80, 40),
                    ),
                    elevation: MaterialStateProperty.all(4),
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text(
                    "Take another Riddle",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Text("${roundedPercentageScore}%"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
