class NavigateQuestion {
  final int id;
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;
  Option? correctAnswer;

  NavigateQuestion({
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

final navigateQuestionsList = [
  NavigateQuestion(
    text:
        "I am a widget that manages a stack of child widgets and allows for navigating between them. What am I?",
    options: [
      const Option(text: "Route", isCorrect: false),
      const Option(text: "Scaffold", isCorrect: false),
      const Option(text: "Navigator", isCorrect: true),
      const Option(text: "PageView", isCorrect: false),
    ],
    id: 0,
    correctAnswer: const Option(text: "Navigator", isCorrect: true),
  ),
  NavigateQuestion(
    text:
        " I am a method that removes the current route from the stack and returns to the previous route. What am I?",
    options: [
      const Option(text: "Navigator.push()", isCorrect: false),
      const Option(text: "Navigator.pop()", isCorrect: true),
      const Option(text: "Navigator.removeRoute()", isCorrect: false),
      const Option(text: " Route.dispose()", isCorrect: false),
    ],
    id: 1,
    correctAnswer: const Option(text: "Navigator.pop()", isCorrect: true),
  ),
  NavigateQuestion(
    text:
        "I am a widget property that must be passed to navigation methods like Navigator.push() to specify the next screen. What am I?",
    options: [
      const Option(text: "context", isCorrect: true),
      const Option(text: "Scaffold", isCorrect: false),
      const Option(text: "State", isCorrect: false),
      const Option(text: "Build", isCorrect: false),
    ],
    id: 2,
    correctAnswer: const Option(text: "context", isCorrect: true),
  ),

  NavigateQuestion(
    text:
        " I am the method that closes all routes in the history stack to pop to the first route. What am I?",
    options: [
      const Option(text: "Navigator.popUntil()", isCorrect: true),
      const Option(text: " Navigator.reset()", isCorrect: false),
      const Option(text: " Navigator.exitAll()", isCorrect: false),
      const Option(text: "Navigator.clear()", isCorrect: false),
    ],
    id: 3,
    correctAnswer: const Option(text: "Navigator.popUntil()", isCorrect: true),
  ),
  // other 4
  NavigateQuestion(
    text:
        " I am a method that adds a named route to the top of the navigator stack. Who am I?",
    options: [
      const Option(text: "Navigator.navigate()", isCorrect: false),
      const Option(text: " Navigator.openRoute()", isCorrect: false),
      const Option(text: " Navigator.routeTo()", isCorrect: false),
      const Option(text: " Navigator.pushNamed()", isCorrect: true),
    ],
    id: 4,
    correctAnswer: const Option(
      text: " Navigator.pushNamed()",
      isCorrect: true,
    ),
  ),
  NavigateQuestion(
    text:
        " I am a method that replaces the entire route stack with a single route. Who am I?",
    options: [
      const Option(text: " Navigator.pushReplacement()", isCorrect: true),
      const Option(text: "Navigator.reset()", isCorrect: false),
      const Option(text: " Navigator.replaceAll()", isCorrect: false),
      const Option(text: "  Navigator.clearPush()", isCorrect: false),
    ],
    id: 5,
    correctAnswer:
        const Option(text: "Navigator.pushReplacement()", isCorrect: true),
  ),

  NavigateQuestion(
    text:
        "I am a method that closes routes until a condition is met. Who am I?",
    options: [
      const Option(text: "Navigator.exitUntil()", isCorrect: false),
      const Option(text: "Navigator.closeAllUntil(),", isCorrect: false),
      const Option(text: "Navigator.popWhile()", isCorrect: false),
      const Option(text: " Navigator.popUntil()", isCorrect: true),
    ],
    id: 6,
    correctAnswer: const Option(text: " Navigator.popUntil()", isCorrect: true),
  ),
  NavigateQuestion(
    text:
        "I am an event fired when a route is popped to transition back. Who am I?",
    options: [
      const Option(text: "onWillPop", isCorrect: true),
      const Option(text: "onPop", isCorrect: false),
      const Option(text: "didPop", isCorrect: false),
      const Option(text: "popRoute", isCorrect: false),
    ],
    id: 7,
    correctAnswer: const Option(text: "onWillPop", isCorrect: true),
  ),

  NavigateQuestion(
    text:
        "I am a method that adds a route to the history without removing current. Who am I?",
    options: [
      const Option(text: "openRoute()", isCorrect: false),
      const Option(text: "onDestroy()", isCorrect: false),
      const Option(text: "Navigator.push()", isCorrect: true),
      const Option(text: "overlayRoute()", isCorrect: false),
    ],
    id: 8,
    correctAnswer: const Option(text: "Navigator.push()", isCorrect: true),
  ),
];
