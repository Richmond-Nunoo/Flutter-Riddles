import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color bgColor = Color(0xFF4993FA);

class FlutterTopics {
  final int id;
  final String topicName;
  final IconData topicIcon;
  final Color topicColor;
  FlutterTopics(
      {required this.id,
      required this.topicColor,
      required this.topicIcon,
      required this.topicName,});
}

final List<FlutterTopics> flutterTopicsList = [
  FlutterTopics(
    id: 0,
    topicColor: bgColor,
    topicIcon: CupertinoIcons.square_stack_3d_up,
    topicName: "Widgets",
  ),
  FlutterTopics(
    id: 1,
    topicColor: bgColor,
    topicIcon: CupertinoIcons.arrow_2_circlepath,
    topicName: "State Management",
  ),
  FlutterTopics(
    id: 2,
    topicColor: bgColor,
    topicIcon: CupertinoIcons.graph_circle,
    topicName: "App LifeCycle",
  ),
  FlutterTopics(
    id: 3,
    topicColor: bgColor,
    topicIcon: CupertinoIcons.rectangle_arrow_up_right_arrow_down_left,
    topicName: "Layouts and UI",
  ),
];
