import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Courses",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.black, fontWeight: FontWeight.w600)),
          ),
          Row(
            children: [
              ...courses.map((course) => CourseCard(course: course)).toList(),
            ],
          )
        ]),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      height: 280,
      width: 260,
      decoration: const BoxDecoration(
          color: Color(0xFF7553F6),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 8),
                child: Text(
                  course.description,
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
              const Text(
                "61 SECTIONS - 11 HOURS",
                style: TextStyle(color: Colors.white54),
              ),
              const Spacer(),
              Row(
                children: List.generate(
                    3,
                    (index) => Transform.translate(
                          offset: Offset((-10 * index).toDouble(), 0),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                                "assets/avaters/Avatar ${index + 1}.jpg"),
                          ),
                        )),
              )
            ],
          ),
        ),
        SvgPicture.asset(course.iconSrc),
      ]),
    );
  }
}

class Course {
  final String title, description, iconSrc;
  final Color bgColor;

  Course(
      {required this.title,
      this.description = "Build and animate an iOS app from scratch",
      this.iconSrc = "assets/icons/iso.svg",
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
