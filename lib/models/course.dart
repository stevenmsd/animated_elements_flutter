import 'package:flutter/material.dart';

class Course {
  final String title, description, iconSrc;
  final Color bgColor;

  Course(
      {required this.title,
      this.description = "Ver conversación completa",
      this.iconSrc = "assets/icons/code.svg",
      this.bgColor = const Color(0xFF7553f6)});
}

List<Course> courses = [
  Course(title: "Ayudame, quiero saber como realizar...."),
  Course(
    title: "Animations in Flutter",
    iconSrc: "assets/icons/code.svg",
    bgColor: const Color(0xFF80A4FF),
  ),
];

List<Course> resentCourses = [
  Course(title: "Charla cientifíca"),
  Course(
    title: "Traducir texto",
    bgColor: const Color(0xFF9CC5FF),
    iconSrc: "assets/icons/code.svg",
  ),
  Course(
    title: "Profesor de Matemáticas",
    iconSrc: "assets/icons/code.svg",
  ),
];
