class WidgetQuestion {
  final int id;
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;
  Option correctAnswer;

  WidgetQuestion(
      {required this.text,
      required this.options,
      this.isLocked = false,
      this.selectedOption,
      required this.id,
      required this.correctAnswer});

  WidgetQuestion copyWith() {
    return WidgetQuestion(
      id: id,
      text: text,
      options: options
          .map((option) =>
              Option(text: option.text, isCorrect: option.isCorrect))
          .toList(),
      isLocked: isLocked,
      selectedOption: selectedOption,
      correctAnswer: correctAnswer,
    );
  }
}

class Option {
  final String text;
  final bool isCorrect;

  const Option({
    required this.text,
    required this.isCorrect,
  });
}

final widgetQuestionsList = [
  WidgetQuestion(
    text:
        "I am a Flutter widget that provides a scrollable list of children. What am I?",
    options: [
      const Option(text: "ListView", isCorrect: true),
      const Option(text: "Column", isCorrect: false),
      const Option(text: "Row", isCorrect: false),
      const Option(text: "Wrap", isCorrect: false),
    ],
    id: 0,
    correctAnswer: const Option(text: "ListView", isCorrect: true),
  ),
  WidgetQuestion(
      text:
          "I am a widget used to display a single piece of content and expand to fill the available space. What am I?",
      options: [
        const Option(text: "Flexible", isCorrect: false),
        const Option(text: "Expanded", isCorrect: true),
        const Option(text: "Container", isCorrect: false),
        const Option(text: "SizedBox", isCorrect: false),
      ],
      id: 1,
      correctAnswer: const Option(text: "Expanded", isCorrect: true)),
  WidgetQuestion(
      text:
          " I am a circular or elliptical shape with a specific radius. What am I?",
      options: [
        const Option(text: "ClipRRect", isCorrect: false),
        const Option(text: "DecoratedBox", isCorrect: false),
        const Option(text: "ClipOval", isCorrect: false),
        const Option(text: "CircleAvatar", isCorrect: true),
      ],
      id: 2,
      correctAnswer: const Option(text: "CircleAvatar", isCorrect: true)),
  WidgetQuestion(
      text:
          "I am a widget that creates a button with an icon and a label. What am I?",
      options: [
        const Option(text: "Elevated Button", isCorrect: false),
        const Option(text: "TextButton", isCorrect: false),
        const Option(text: "IconButton", isCorrect: true),
        const Option(text: "TextButton.icon", isCorrect: false),
      ],
      id: 3,
      correctAnswer: const Option(text: "IconButton", isCorrect: true)),
  // other 4
  WidgetQuestion(
      text:
          " I am a widget that provides a responsive grid of tiles with multiple children. What am I?",
      options: [
        const Option(text: "ListTile", isCorrect: false),
        const Option(text: "singleChildScrollView", isCorrect: false),
        const Option(text: "ListView", isCorrect: false),
        const Option(text: "GridView", isCorrect: true),
      ],
      id: 4,
      correctAnswer: const Option(text: "GridView", isCorrect: true)),
  WidgetQuestion(
      text:
          "I am a widget that creates a collapsible tile with an optional leading and trailing widget. What am I?",
      options: [
        const Option(text: "ExpansionTile", isCorrect: true),
        const Option(text: "DropdownButton", isCorrect: false),
        const Option(text: "Card", isCorrect: false),
        const Option(text: "AppBar", isCorrect: false),
      ],
      id: 5,
      correctAnswer: const Option(text: "ExpansionTile", isCorrect: true)),

  WidgetQuestion(
      text:
          " I am a widget that provides a rectangular box with a specified width, height, and color. What am I?",
      options: [
        const Option(text: "Container", isCorrect: true),
        const Option(text: "Card", isCorrect: false),
        const Option(text: "SizedBox", isCorrect: false),
        const Option(text: "Padding", isCorrect: false),
      ],
      id: 6,
      correctAnswer: const Option(text: "Container", isCorrect: true)),
  WidgetQuestion(
      text:
          "I am a widget that displays an image from the specified network URL. What am I?",
      options: [
        const Option(text: "Image.network", isCorrect: true),
        const Option(text: "AssetImage", isCorrect: false),
        const Option(text: "Image.asset", isCorrect: true),
        const Option(text: "Image.file", isCorrect: false),
      ],
      id: 7,
      correctAnswer: const Option(text: "Image.network", isCorrect: true)),
];
