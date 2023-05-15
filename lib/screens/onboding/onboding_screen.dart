import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(children: [
        Positioned(
            width: size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png")),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
        )),
        const RiveAnimation.asset(
          "assets/RiveAssets/shapes.riv",
          fit: BoxFit.cover,
        ),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: const SizedBox(),
        )),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              SizedBox(
                width: 260,
                child: Column(
                  children: const [
                    Text(
                      "Learn desing & code",
                      style: TextStyle(
                          fontSize: 60, fontFamily: "Poppins", height: 1.2),
                    ),
                    Text(
                        "Don't skip desing. Learn design and conde, by Steeven real apps with Flutter and Switf. Complete courses about the best tools")
                  ],
                ),
              ),
            ],
          ),
        ))
      ]),
    );
  }
}
