import 'package:flashcards_quiz/views/flash_cards.dart';
import 'package:flashcards_quiz/views/widget_time.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFFF9F7F7);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                getGreeting(),
              ),
              const Text("Flutter Dev."),
              const Padding(
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                child: Text(
                  "What Do you want to test yourself on?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        height: 20,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyCustomWidget(),
                      ),
                    );
                  },
                  child: const Text("Flash Cards"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
