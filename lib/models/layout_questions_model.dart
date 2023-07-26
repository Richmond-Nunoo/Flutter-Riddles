class LayOutQuestion {
  final int id;
  final String text;
  final List<LayOutOption> options;
  bool isLocked;
  LayOutOption? selectedWiidgetOption;
  LayOutOption? correctAnswer;
  // final int timeSeconds;

  LayOutQuestion({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedWiidgetOption,
    required this.id,
    required this.correctAnswer,
    //  required this.timeSeconds
  });

  LayOutQuestion copyWith() {
    return LayOutQuestion(
      id: id,
      text: text,
      options: options
          .map(
            (option) =>
                LayOutOption(text: option.text, isCorrect: option.isCorrect),
          )
          .toList(),
      isLocked: isLocked,
      selectedWiidgetOption: selectedWiidgetOption,
      correctAnswer: correctAnswer,
    );
  }
}

class LayOutOption {
  final String text;
  final bool isCorrect;

  const LayOutOption({
    required this.text,
    required this.isCorrect,
  });
}

final layOutQuestionsList = [
  LayOutQuestion(
    text: "I control how widgets are placed vertically in a column. Who am I?",
    options: [
      const LayOutOption(text: "MainAxisAlignment", isCorrect: true),
      const LayOutOption(text: "Row", isCorrect: false),
      const LayOutOption(text: "CrossAxisAlignment", isCorrect: false),
      const LayOutOption(text: "mainAxisSize", isCorrect: false),
    ],
    id: 0,
    correctAnswer:
        const LayOutOption(text: "MainAxisAlignment", isCorrect: true),
  ),
  LayOutQuestion(
    text:
        "I allow widgets to expand and contract based on available space. You'll always find me inside a Flex. Who am I?",
    options: [
      const LayOutOption(text: "Flexible ", isCorrect: true),
      const LayOutOption(text: "Expanded", isCorrect: false),
      const LayOutOption(text: "Flex", isCorrect: false),
      const LayOutOption(text: "mainAxisSpacing", isCorrect: false),
    ],
    id: 1,
    correctAnswer: const LayOutOption(text: "Flexible", isCorrect: true),
  ),

  LayOutQuestion(
    text:
        "I create an invisible bounding box that controls my child's width and height. What am I?",
    options: [
      const LayOutOption(text: "Container ", isCorrect: true),
      const LayOutOption(text: "SizedBox", isCorrect: false),
      const LayOutOption(text: "Card", isCorrect: false),
      const LayOutOption(text: "Row", isCorrect: false),
    ],
    id: 2,
    correctAnswer: const LayOutOption(text: "Container", isCorrect: true),
  ),

  LayOutQuestion(
    text:
        "I align my children widgets to the start or end of the row. Who am I?",
    options: [
      const LayOutOption(text: "SingleChildScrollView", isCorrect: false),
      const LayOutOption(text: "crossAxisCount", isCorrect: false),
      const LayOutOption(text: "MainAxisAlignment ", isCorrect: true),
      const LayOutOption(text: "crossAxisSpacing", isCorrect: false),
    ],
    id: 3,
    correctAnswer:
        const LayOutOption(text: "MainAxisAlignment ", isCorrect: true),
  ),
  // other 4
  LayOutQuestion(
    text:
        "I'm a widget that lets you precisely position children using x, y coordinates. Who am I?",
    options: [
      const LayOutOption(text: "Align", isCorrect: false),
      const LayOutOption(text: "FittedBox", isCorrect: false),
      const LayOutOption(text: "Postioned", isCorrect: false),
      const LayOutOption(text: "Stack ", isCorrect: true),
    ],
    id: 4,
    correctAnswer: const LayOutOption(text: "Stack ", isCorrect: true),
  ),
  LayOutQuestion(
    text: "I'm a horizontal version of Column. Who am I?",
    options: [
      const LayOutOption(text: "Row ", isCorrect: true),
      const LayOutOption(text: "Divider", isCorrect: false),
      const LayOutOption(text: "Column", isCorrect: false),
      const LayOutOption(text: "Stack", isCorrect: false),
    ],
    id: 5,
    correctAnswer: const LayOutOption(text: "Row", isCorrect: true),
  ),

  LayOutQuestion(
    text:
        "I align widgets to the top, bottom, center inside a Column. What am I?",
    options: [
      const LayOutOption(text: "Row", isCorrect: false),
      const LayOutOption(text: "Align", isCorrect: false),
      const LayOutOption(text: "Spacer", isCorrect: false),
      const LayOutOption(text: "MainAxisAlignment ", isCorrect: true),
    ],
    id: 6,
    correctAnswer:
        const LayOutOption(text: "MainAxisAlignment ", isCorrect: true),
  ),
  LayOutQuestion(
    text:
        "I align my Row or Column children differently based on available space. Who am I?",
    options: [
      const LayOutOption(text: "Expanded", isCorrect: false),
      const LayOutOption(text: "Flex ", isCorrect: true),
      const LayOutOption(text: "FittedBox", isCorrect: false),
      const LayOutOption(text: "Wrap", isCorrect: false),
    ],
    id: 7,
    correctAnswer: const LayOutOption(text: "Scoped Model", isCorrect: true),
  ),
];
