import 'package:flutter/material.dart';

class Course {
  final String title, description, iconSrc;
  final Color bgColor;

  Course(
      {required this.title,
      this.description = "Build and animate an iOS app from scratch",
      this.iconSrc = "assets/icons/code.svg",
      this.bgColor = const Color(0xFF7553f6)});
}

List<Course> courses = [
  Course(title: "Animations in SwiftUI"),
  Course(
    title: "Animations in Flutter",
    iconSrc: "assets/icons/code.svg",
    bgColor: const Color(0xFF80A4FF),
  ),
];

List<Course> resentCourses = [
  Course(title: "State Machine"),
  Course(
    title: "Animated Menu",
    bgColor: const Color(0xFF9CC5FF),
    iconSrc: "assets/icons/code.svg",
  ),
  Course(
    title: "Animated Menu",
    bgColor: const Color(0xFF9CC5FF),
    iconSrc: "assets/icons/code.svg",
  ),
];
