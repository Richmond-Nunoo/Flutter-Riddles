import 'package:flashcards_quiz/views/flash_cards.dart';
import 'package:flashcards_quiz/views/widget_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF60ABFB);
    const Color bgColor3 = Color(0xFF5170FD);

    return Scaffold(
      backgroundColor: bgColor3,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                            value: 0.5,
                            backgroundColor: Colors.blue.shade100,
                            color: Colors.blueGrey,
                            valueColor: AlwaysStoppedAnimation(bgColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Text(
                //   getGreeting(),
                // ),
                // const Text("Flutter Dev."),
                // const Padding(
                //   padding:
                //       EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                //   child: Text(
                //     "What Do you want to test yourself on?",
                //     style: TextStyle(
                //       fontSize: 24,
                //       fontWeight: FontWeight.bold,
                //     ),
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                Stack(
                  fit: StackFit.loose,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    InkWell(
                      onTap: () {
                        print("lol stack");
                      },
                      child: Container(
                        height: 400,
                        width: MediaQuery.of(context).size.width * 0.75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: bgColor,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Which Widget?"),
                                  Text("1/5"),
                                ],
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text("Tap to Flip"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -120,
                      top: 30,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: bgColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: -100,
                      bottom: 20,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: bgColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
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
                    onPressed: () {},
                    child: const Text(
                      "Reset Game",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Center(
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => const MyCustomWidget(),
                //         ),
                //       );
                //     },
                //     child: const Text("Flash Cards"),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
