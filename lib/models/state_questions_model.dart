class StateQuestion {
  final int id;
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;
  Option? correctAnswer;

  StateQuestion({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
    required this.id,
    required this.correctAnswer,
  });
}

class Option {
  final String text;
  final bool isCorrect;

  const Option({
    required this.text,
    required this.isCorrect,
  });
}

final stateQuestions = [
  StateQuestion(
    text:
        "I am a simple method to manage state within a StatefulWidget. What am I?",
    options: [
      const Option(text: "MobX", isCorrect: false),
      const Option(text: "Bloc", isCorrect: false),
      const Option(text: "setState", isCorrect: true),
      const Option(text: "Riverpod", isCorrect: false),
    ],
    id: 0,
    correctAnswer: const Option(text: "setState", isCorrect: true),
  ),
  StateQuestion(
    text:
        "I am a Flutter package that enables reactive programming and observable state objects. ",
    options: [
      const Option(text: "Riverpod", isCorrect: false),
      const Option(text: "Mobx", isCorrect: true),
      const Option(text: "Provider", isCorrect: false),
      const Option(text: "setState", isCorrect: false),
    ],
    id: 1,
    correctAnswer: const Option(text: "Mobx", isCorrect: true),
  ),
  StateQuestion(
    text:
        "What is the name of the Flutter state management approach that uses a widget tree to hold the app state and update the UI, and is similar to Provider?",
    options: [
      const Option(text: "Riverpod", isCorrect: true),
      const Option(text: "Bloc", isCorrect: false),
      const Option(text: "Redux", isCorrect: false),
      const Option(text: "Mobx", isCorrect: false),
    ],
    id: 2,
    correctAnswer: const Option(text: "Riverpod", isCorrect: true),
  ),

  StateQuestion(
    text:
        "I am a lightweight and powerful solution for Flutter, combining state management and dependency injection. What am I?",
    options: [
      const Option(text: "Getx", isCorrect: true),
      const Option(text: "Riverpod", isCorrect: false),
      const Option(text: "Redux", isCorrect: false),
      const Option(text: "Get_it", isCorrect: false),
    ],
    id: 3,
    correctAnswer: const Option(text: "Getx", isCorrect: true),
  ),
  // other 4
  StateQuestion(
    text:
        "I am a feature of ****** that allows developers to navigate between routes without using context. What am I?",
    options: [
      const Option(text: "Mobx", isCorrect: false),
      const Option(text: "InheritedWidgets", isCorrect: false),
      const Option(text: "Provider", isCorrect: false),
      const Option(text: "Getx", isCorrect: true),
    ],
    id: 4,
    correctAnswer: const Option(text: "Getx", isCorrect: true),
  ),
  StateQuestion(
    text: "I use streams and sinks for state management, who am I?",
    options: [
      const Option(text: "Bloc", isCorrect: true),
      const Option(text: "GetX", isCorrect: false),
      const Option(text: "Provider", isCorrect: false),
      const Option(text: "InheritedWidgets", isCorrect: false),
    ],
    id: 5,
    correctAnswer: const Option(text: "Bloc", isCorrect: true),
  ),

  StateQuestion(
    text: "I allow using React-like hooks in Flutter, who am I?",
    options: [
      const Option(text: "GetX", isCorrect: false),
      const Option(text: "Redux", isCorrect: false),
      const Option(text: "Mobx", isCorrect: false),
      const Option(text: "Hooks", isCorrect: true),
    ],
    id: 6,
    correctAnswer: const Option(text: "Hooks", isCorrect: true),
  ),
  StateQuestion(
    text:
        "I am a Flutter package that helps manage state by providing a way to handle scoped state. What am I?",
    options: [
      const Option(text: "Scoped Model", isCorrect: true),
      const Option(text: "Flutter Hooks", isCorrect: false),
      const Option(text: "Provider", isCorrect: false),
      const Option(text: "GetX", isCorrect: false),
    ],
    id: 7,
    correctAnswer: const Option(text: "Scoped Model", isCorrect: true),
  ),
];
