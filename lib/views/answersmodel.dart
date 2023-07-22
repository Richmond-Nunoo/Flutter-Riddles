import 'package:flutter/material.dart';

class AnswerCandidateModel {
  String? name;
  String? job;
  String? city;
  Color? color;

  AnswerCandidateModel({
    this.name,
    this.job,
    this.city,
    this.color,
  });
}

List<AnswerCandidateModel> answerCandidates = [
  AnswerCandidateModel(
    name: 'The Fifth question',
    job: 'Manager',
    city: 'Town',
    color: Colors.amber,
  ),
  AnswerCandidateModel(
    name: 'Fourth Question',
    job: 'Manager',
    city: 'Town',
    color: Colors.blue,
  ),
  AnswerCandidateModel(
    name: 'Third Question',
    job: 'Manager',
    city: 'Town',
    color: Colors.red,
  ),
  AnswerCandidateModel(
    name: 'Second Question',
    job: 'Manager',
    city: 'Town',
    color: Colors.green,
  ),
  AnswerCandidateModel(
    name: 'First Question',
    job: 'Manager',
    city: 'Town',
    color: Colors.brown,
  ),
];
