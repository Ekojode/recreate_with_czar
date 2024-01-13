import 'package:flutter/material.dart';

class LessonModel {
  final String title;
  final String description;
  final String image;
  final Color color;

  LessonModel(
      {required this.title,
      required this.description,
      required this.image,
      required this.color});
}
