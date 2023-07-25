class StateQuestion {
  final int id;
  final String text;
  final List<StateOption> options;
  bool isLocked;
  StateOption? selectedWiidgetOption;
  StateOption? correctAnswer;

  StateQuestion({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedWiidgetOption,
    required this.id,
    required this.correctAnswer,
  });
  StateQuestion copyWith() {
    return StateQuestion(
      id: id,
      text: text,
      options: options
          .map((option) =>
              StateOption(text: option.text, isCorrect: option.isCorrect))
          .toList(),
      isLocked: isLocked,
      selectedWiidgetOption: selectedWiidgetOption,
      correctAnswer: correctAnswer,
    );
  }
}

class StateOption {
  final String text;
  final bool isCorrect;

  const StateOption({
    required this.text,
    required this.isCorrect,
  });
}

final stateQuestionsList = [
  StateQuestion(
    text:
        "I am a simple method to manage state within a StatefulWidget. What am I?",
    options: [
      const StateOption(text: "MobX", isCorrect: false),
      const StateOption(text: "Bloc", isCorrect: false),
      const StateOption(text: "setState", isCorrect: true),
      const StateOption(text: "Riverpod", isCorrect: false),
    ],
    id: 0,
    correctAnswer: const StateOption(text: "setState", isCorrect: true),
  ),
  StateQuestion(
    text:
        "I am a Flutter package that enables reactive programming and observable state objects. ",
    options: [
      const StateOption(text: "Riverpod", isCorrect: false),
      const StateOption(text: "Mobx", isCorrect: true),
      const StateOption(text: "Provider", isCorrect: false),
      const StateOption(text: "setState", isCorrect: false),
    ],
    id: 1,
    correctAnswer: const StateOption(text: "Mobx", isCorrect: true),
  ),
  StateQuestion(
    text:
        "What is the name of the Flutter state management approach that uses a widget tree to hold the app state and update the UI, and is similar to Provider?",
    options: [
      const StateOption(text: "Riverpod", isCorrect: true),
      const StateOption(text: "Bloc", isCorrect: false),
      const StateOption(text: "Redux", isCorrect: false),
      const StateOption(text: "Mobx", isCorrect: false),
    ],
    id: 2,
    correctAnswer: const StateOption(text: "Riverpod", isCorrect: true),
  ),

  StateQuestion(
    text:
        "I am a lightweight and powerful solution for Flutter, combining state management and dependency injection. What am I?",
    options: [
      const StateOption(text: "Getx", isCorrect: true),
      const StateOption(text: "Riverpod", isCorrect: false),
      const StateOption(text: "Redux", isCorrect: false),
      const StateOption(text: "Get_it", isCorrect: false),
    ],
    id: 3,
    correctAnswer: const StateOption(text: "Getx", isCorrect: true),
  ),
  // other 4
  StateQuestion(
    text:
        "I am a feature of ****** that allows developers to navigate between routes without using context. What am I?",
    options: [
      const StateOption(text: "Mobx", isCorrect: false),
      const StateOption(text: "InheritedWidgets", isCorrect: false),
      const StateOption(text: "Provider", isCorrect: false),
      const StateOption(text: "Getx", isCorrect: true),
    ],
    id: 4,
    correctAnswer: const StateOption(text: "Getx", isCorrect: true),
  ),
  StateQuestion(
    text: "I use streams and sinks for state management, who am I?",
    options: [
      const StateOption(text: "Bloc", isCorrect: true),
      const StateOption(text: "GetX", isCorrect: false),
      const StateOption(text: "Provider", isCorrect: false),
      const StateOption(text: "InheritedWidgets", isCorrect: false),
    ],
    id: 5,
    correctAnswer: const StateOption(text: "Bloc", isCorrect: true),
  ),

  StateQuestion(
    text: "I allow using React-like hooks in Flutter, who am I?",
    options: [
      const StateOption(text: "GetX", isCorrect: false),
      const StateOption(text: "Redux", isCorrect: false),
      const StateOption(text: "Mobx", isCorrect: false),
      const StateOption(text: "Hooks", isCorrect: true),
    ],
    id: 6,
    correctAnswer: const StateOption(text: "Hooks", isCorrect: true),
  ),
  StateQuestion(
    text:
        "I am a Flutter package that helps manage state by providing a way to handle scoped state. What am I?",
    options: [
      const StateOption(text: "Scoped Model", isCorrect: true),
      const StateOption(text: "Flutter Hooks", isCorrect: false),
      const StateOption(text: "Provider", isCorrect: false),
      const StateOption(text: "GetX", isCorrect: false),
    ],
    id: 7,
    correctAnswer: const StateOption(text: "Scoped Model", isCorrect: true),
  ),

  StateQuestion(
    text:
        " I am the method in a StatefulWidget that is called when the widget is being removed from the widget tree. What am I?",
    options: [
      const StateOption(text: "initState()", isCorrect: false),
      const StateOption(text: "onDestroy()", isCorrect: false),
      const StateOption(text: "dispose()", isCorrect: true),
      const StateOption(text: "setState()", isCorrect: false),
    ],
    id: 8,
    correctAnswer: const StateOption(text: "dispose()", isCorrect: true),
  ),

  StateQuestion(
    text:
        "I am the first thing that happens when a Flutter app is launched. I am called by the Dart VM. What am I?",
    options: [
      const StateOption(text: "main()", isCorrect: true),
      const StateOption(text: "onDestroy()", isCorrect: false),
      const StateOption(text: "dispose()", isCorrect: false),
      const StateOption(text: "onCreate()", isCorrect: false),
    ],
    id: 9,
    correctAnswer: const StateOption(text: "main()", isCorrect: true),
  ),

  StateQuestion(
    text:
        "I am called after the main() function. I am responsible for creating the Flutter app's root widget. What am I?",
    options: [
      const StateOption(text: "main()", isCorrect: false),
      const StateOption(text: "runApp()", isCorrect: true),
      const StateOption(text: "dispose()", isCorrect: false),
      const StateOption(text: "onCreate()", isCorrect: false),
    ],
    id: 10,
    correctAnswer: const StateOption(text: "runApp()", isCorrect: true),
  ),

  StateQuestion(
    text:
        "I am a method that notifies the framework that the internal state of a StatefulWidget has changed. This triggers a rebuild. What am I?",
    options: [
      const StateOption(text: "Provider", isCorrect: false),
      const StateOption(text: "runApp()", isCorrect: false),
      const StateOption(text: "setState()", isCorrect: true),
      const StateOption(text: "onCreate()", isCorrect: false),
    ],
    id: 11,
    correctAnswer: const StateOption(text: "setState()", isCorrect: true),
  ),
];
