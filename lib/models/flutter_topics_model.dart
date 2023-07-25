import 'package:flashcards_quiz/models/layout_questions_model.dart';
import 'package:flashcards_quiz/models/naviagation_questions_model.dart';
import 'package:flashcards_quiz/models/widget_questions_model.dart';
import 'package:flashcards_quiz/models/state_questions_model.dart';
import 'package:flutter/cupertino.dart';

const Color bgColor = Color(0xFF4993FA);

class FlutterTopics {
  final int id;
  final String topicName;
  final IconData topicIcon;
  final Color topicColor;
  final List<dynamic> topicQuestions;
  FlutterTopics({
    required this.id,
    required this.topicColor,
    required this.topicIcon,
    required this.topicName,
    required this.topicQuestions,
  });
}

final List<FlutterTopics> flutterTopicsList = [
  FlutterTopics(
    id: 0,
    topicColor: bgColor,
    topicIcon: CupertinoIcons.square_stack_3d_up,
    topicName: "Widgets",
    topicQuestions: widgetQuestionsList,
  ),
  FlutterTopics(
    id: 1,
    topicColor: bgColor,
    topicIcon: CupertinoIcons.arrow_2_circlepath,
    topicName: "State Management",
    topicQuestions: stateQuestionsList,
  ),
  FlutterTopics(
    id: 2,
    topicColor: bgColor,
    topicIcon: CupertinoIcons.paperplane,
    topicName: "Navigation and Routing",
    topicQuestions: navigateQuestionsList,
  ),
  FlutterTopics(
    id: 3,
    topicColor: bgColor,
    topicIcon: CupertinoIcons.rectangle_arrow_up_right_arrow_down_left,
    topicName: "Layouts and UI",
    topicQuestions: layOutQuestionsList,
  ),
];
