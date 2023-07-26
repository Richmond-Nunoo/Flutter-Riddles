class NavigateQuestion {
  final int id;
  final String text;
  final List<NavigationsOption> options;
  bool isLocked;
  NavigationsOption? selectedWiidgetOption;
  NavigationsOption? correctAnswer;

  NavigateQuestion({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedWiidgetOption,
    required this.id,
    required this.correctAnswer,
  });

  NavigateQuestion copyWith() {
    return NavigateQuestion(
      id: id,
      text: text,
      options: options
          .map((option) =>
              NavigationsOption(text: option.text, isCorrect: option.isCorrect))
          .toList(),
      isLocked: isLocked,
      selectedWiidgetOption: selectedWiidgetOption,
      correctAnswer: correctAnswer,
    );
  }
}

class NavigationsOption {
  final String text;
  final bool isCorrect;

  const NavigationsOption({
    required this.text,
    required this.isCorrect,
  });
}

final navigateQuestionsList = [
  NavigateQuestion(
    text:
        "I am a widget that manages a stack of child widgets and allows for navigating between them. What am I?",
    options: [
      const NavigationsOption(text: "Route", isCorrect: false),
      const NavigationsOption(text: "Scaffold", isCorrect: false),
      const NavigationsOption(text: "Navigator", isCorrect: true),
      const NavigationsOption(text: "PageView", isCorrect: false),
    ],
    id: 0,
    correctAnswer: const NavigationsOption(text: "Navigator", isCorrect: true),
  ),
  NavigateQuestion(
    text:
        " I am a method that removes the current route from the stack and returns to the previous route. What am I?",
    options: [
      const NavigationsOption(text: "Navigator.push()", isCorrect: false),
      const NavigationsOption(text: "Navigator.pop()", isCorrect: true),
      const NavigationsOption(
          text: "Navigator.removeRoute()", isCorrect: false),
      const NavigationsOption(text: " Route.dispose()", isCorrect: false),
    ],
    id: 1,
    correctAnswer:
        const NavigationsOption(text: "Navigator.pop()", isCorrect: true),
  ),
  NavigateQuestion(
    text:
        "I am a widget property that must be passed to navigation methods like Navigator.push() to specify the next screen. What am I?",
    options: [
      const NavigationsOption(text: "context", isCorrect: true),
      const NavigationsOption(text: "Scaffold", isCorrect: false),
      const NavigationsOption(text: "State", isCorrect: false),
      const NavigationsOption(text: "Build", isCorrect: false),
    ],
    id: 2,
    correctAnswer: const NavigationsOption(text: "context", isCorrect: true),
  ),

  NavigateQuestion(
    text:
        " I am the method that closes all routes in the history stack to pop to the first route. What am I?",
    options: [
      const NavigationsOption(text: "Navigator.popUntil()", isCorrect: true),
      const NavigationsOption(text: " Navigator.reset()", isCorrect: false),
      const NavigationsOption(text: " Navigator.exitAll()", isCorrect: false),
      const NavigationsOption(text: "Navigator.clear()", isCorrect: false),
    ],
    id: 3,
    correctAnswer:
        const NavigationsOption(text: "Navigator.popUntil()", isCorrect: true),
  ),
  // other 4
  NavigateQuestion(
    text:
        " I am a method that adds a named route to the top of the navigator stack. Who am I?",
    options: [
      const NavigationsOption(text: "Navigator.navigate()", isCorrect: false),
      const NavigationsOption(text: " Navigator.openRoute()", isCorrect: false),
      const NavigationsOption(text: " Navigator.routeTo()", isCorrect: false),
      const NavigationsOption(text: " Navigator.pushNamed()", isCorrect: true),
    ],
    id: 4,
    correctAnswer: const NavigationsOption(
      text: " Navigator.pushNamed()",
      isCorrect: true,
    ),
  ),
  NavigateQuestion(
    text:
        " I am a method that replaces the entire route stack with a single route. Who am I?",
    options: [
      const NavigationsOption(
          text: " Navigator.pushReplacement()", isCorrect: true),
      const NavigationsOption(text: "Navigator.reset()", isCorrect: false),
      const NavigationsOption(
          text: " Navigator.replaceAll()", isCorrect: false),
      const NavigationsOption(
          text: "  Navigator.clearPush()", isCorrect: false),
    ],
    id: 5,
    correctAnswer: const NavigationsOption(
        text: "Navigator.pushReplacement()", isCorrect: true),
  ),

  NavigateQuestion(
    text:
        "I am a method that closes routes until a condition is met. Who am I?",
    options: [
      const NavigationsOption(text: "Navigator.exitUntil()", isCorrect: false),
      const NavigationsOption(
          text: "Navigator.closeAllUntil(),", isCorrect: false),
      const NavigationsOption(text: "Navigator.popWhile()", isCorrect: false),
      const NavigationsOption(text: " Navigator.popUntil()", isCorrect: true),
    ],
    id: 6,
    correctAnswer:
        const NavigationsOption(text: " Navigator.popUntil()", isCorrect: true),
  ),
  NavigateQuestion(
    text:
        "I am an event fired when a route is popped to transition back. Who am I?",
    options: [
      const NavigationsOption(text: "onWillPop", isCorrect: true),
      const NavigationsOption(text: "onPop", isCorrect: false),
      const NavigationsOption(text: "didPop", isCorrect: false),
      const NavigationsOption(text: "popRoute", isCorrect: false),
    ],
    id: 7,
    correctAnswer: const NavigationsOption(text: "onWillPop", isCorrect: true),
  ),

  NavigateQuestion(
    text:
        "I am a method that adds a route to the history without removing current. Who am I?",
    options: [
      const NavigationsOption(text: "openRoute()", isCorrect: false),
      const NavigationsOption(text: "onDestroy()", isCorrect: false),
      const NavigationsOption(text: "Navigator.push()", isCorrect: true),
      const NavigationsOption(text: "overlayRoute()", isCorrect: false),
    ],
    id: 8,
    correctAnswer:
        const NavigationsOption(text: "Navigator.push()", isCorrect: true),
  ),
];
