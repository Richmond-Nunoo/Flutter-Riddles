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
          "I am a circular or elliptical shape with a specific radius. What am I?",
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
  WidgetQuestion(
      text:
          "I give Material apps their signature reactive ink splash effect. Who am I?",
      options: [
        const Option(text: "InkWell", isCorrect: true),
        const Option(text: "GestureDetector", isCorrect: false),
        const Option(text: "AbsorbPointer", isCorrect: true),
        const Option(text: "IgnorePointer", isCorrect: false),
      ],
      id: 8,
      correctAnswer: const Option(text: "InkWell", isCorrect: true)),

  WidgetQuestion(
      text:
          "I am a widget that provides a material design styled line divider. What am I?",
      options: [
        const Option(text: "Divider", isCorrect: true),
        const Option(text: "SizedBox", isCorrect: false),
        const Option(text: "Container", isCorrect: false),
        const Option(text: "ListTile", isCorrect: false),
      ],
      id: 9,
      correctAnswer: const Option(text: "Divider", isCorrect: true)),

  WidgetQuestion(
      text:
          "I am a widget that displays a circular material design spinner to indicate loading. What am I?",
      options: [
        const Option(text: "LinearProgressIndicator", isCorrect: false),
        const Option(text: "RefreshIndicator", isCorrect: false),
        const Option(text: "CircularProgressIndicator", isCorrect: true),
        const Option(text: "LoadingIndicator", isCorrect: false),
      ],
      id: 10,
      correctAnswer:
          const Option(text: "CircularProgressIndicator", isCorrect: true)),
  WidgetQuestion(
      text:
          "I am a widget that displays a material design styled tooltip when the user hovers over it. What am I?",
      options: [
        const Option(text: "Popover", isCorrect: false),
        const Option(text: "Tooltip", isCorrect: true),
        const Option(text: "Snackbar", isCorrect: false),
        const Option(text: "HintText", isCorrect: false),
      ],
      id: 11,
      correctAnswer: const Option(text: "Tooltip", isCorrect: true)),
  WidgetQuestion(
      text:
          "I am the folder containing assets like images, fonts, json files etc. What am I?",
      options: [
        const Option(text: "static", isCorrect: false),
        const Option(text: "assets", isCorrect: true),
        const Option(text: "resources", isCorrect: false),
        const Option(text: "images", isCorrect: false),
      ],
      id: 11,
      correctAnswer: const Option(text: "assets", isCorrect: true)),

  WidgetQuestion(
      text:
          "I am the programming language used to build Flutter apps. What am I?",
      options: [
        const Option(text: "Dart", isCorrect: true),
        const Option(text: "Java", isCorrect: false),
        const Option(text: "Swift", isCorrect: false),
        const Option(text: "Kotlin", isCorrect: false),
      ],
      id: 11,
      correctAnswer: const Option(text: "Dart", isCorrect: true)),

  WidgetQuestion(
    text:
        "I am a mechanism that allows you to incorporate platform-specific UI elements into a Flutter app. What am I?",
    options: [
      const Option(text: "Native view", isCorrect: false),
      const Option(text: "Platform channels", isCorrect: true),
      const Option(text: "JNI", isCorrect: false),
      const Option(text: "Bridge", isCorrect: false),
    ],
    id: 11,
    correctAnswer: const Option(text: "Platform channels", isCorrect: true),
  ),
  WidgetQuestion(
    text:
        "I am a property that uniquely identifies a widget and allows it to be updated efficiently. What am I?",
    options: [
      const Option(text: "key", isCorrect: true),
      const Option(text: "id", isCorrect: false),
      const Option(text: "name", isCorrect: false),
      const Option(text: "tag", isCorrect: false),
    ],
    id: 11,
    correctAnswer: const Option(text: "key", isCorrect: true),
  ),
];
