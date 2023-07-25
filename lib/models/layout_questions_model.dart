class LayOutQuestion {
  final int id;
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;
  Option? correctAnswer;

  LayOutQuestion({
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

final layOutQuestions = [
  LayOutQuestion(
    text: "I control how widgets are placed vertically in a column. Who am I?",
    options: [
      const Option(text: "MainAxisAlignment", isCorrect: true),
      const Option(text: "Row", isCorrect: false),
      const Option(text: "CrossAxisAlignment", isCorrect: true),
      const Option(text: "mainAxisSize", isCorrect: false),
    ],
    id: 0,
    correctAnswer: const Option(text: "MainAxisAlignment", isCorrect: true),
  ),
  LayOutQuestion(
    text:
        "I allow widgets to expand and contract based on available space. You'll always find me inside a Flex. Who am I?",
    options: [
      const Option(text: "Flexible ", isCorrect: true),
      const Option(text: "Expanded", isCorrect: false),
      const Option(text: "Flex", isCorrect: false),
      const Option(text: "mainAxisSpacing", isCorrect: false),
    ],
    id: 1,
    correctAnswer: const Option(text: "Flexible", isCorrect: true),
  ),

  LayOutQuestion(
    text:
        "I create an invisible bounding box that controls my child's width and height. What am I?",
    options: [
      const Option(text: "Container ", isCorrect: true),
      const Option(text: "SizedBox", isCorrect: false),
      const Option(text: "Card", isCorrect: false),
      const Option(text: "Row", isCorrect: false),
    ],
    id: 2,
    correctAnswer: const Option(text: "Container", isCorrect: true),
  ),

  LayOutQuestion(
    text:
        "I align my children widgets to the start or end of the row. Who am I?",
    options: [
      const Option(text: "SingleChildScrollView", isCorrect: false),
      const Option(text: "crossAxisCount", isCorrect: false),
      const Option(text: "MainAxisAlignment ", isCorrect: true),
      const Option(text: "crossAxisSpacing", isCorrect: false),
    ],
    id: 3,
    correctAnswer: const Option(text: "MainAxisAlignment ", isCorrect: true),
  ),
  // other 4
  LayOutQuestion(
    text:
        "I'm a widget that lets you precisely position children using x, y coordinates. Who am I?",
    options: [
      const Option(text: "Align", isCorrect: false),
      const Option(text: "FittedBox", isCorrect: false),
      const Option(text: "Postioned", isCorrect: false),
      const Option(text: "Stack ", isCorrect: true),
    ],
    id: 4,
    correctAnswer: const Option(text: "Stack ", isCorrect: true),
  ),
  LayOutQuestion(
    text: "I'm a horizontal version of Column. Who am I?",
    options: [
      const Option(text: "Row ", isCorrect: true),
      const Option(text: "Divider", isCorrect: false),
      const Option(text: "Column", isCorrect: false),
      const Option(text: "Stack", isCorrect: false),
    ],
    id: 5,
    correctAnswer: const Option(text: "Row", isCorrect: true),
  ),

  LayOutQuestion(
    text:
        "I align widgets to the top, bottom, center inside a Column. What am I?",
    options: [
      const Option(text: "Row", isCorrect: false),
      const Option(text: "Align", isCorrect: false),
      const Option(text: "Spacer", isCorrect: false),
      const Option(text: "MainAxisAlignment ", isCorrect: true),
    ],
    id: 6,
    correctAnswer: const Option(text: "MainAxisAlignment ", isCorrect: true),
  ),
  LayOutQuestion(
    text:
        "I align my Row or Column children differently based on available space. Who am I?",
    options: [
      const Option(text: "Expanded", isCorrect: false),
      const Option(text: "Flex ", isCorrect: true),
      const Option(text: "FittedBox", isCorrect: false),
      const Option(text: "Wrao", isCorrect: false),
    ],
    id: 7,
    correctAnswer: const Option(text: "Scoped Model", isCorrect: true),
  ),
];
