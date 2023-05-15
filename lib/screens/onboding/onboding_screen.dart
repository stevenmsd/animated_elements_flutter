import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import '../components/animated_btn.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btnAnimationController;
  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
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
              const Spacer(
                flex: 2,
              ),
              AnimatedBtn(
                btnAnimationController: _btnAnimationController,
                press: () {
                  _btnAnimationController.isActive = true;
                  showGeneralDialog(
                      barrierDismissible: true,
                      barrierLabel: "Sign In",
                      context: context,
                      pageBuilder: (context, _, __) => Center(
                            child: Container(
                              height: 620,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 32, horizontal: 24),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
                              child: Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Column(
                                  children: [
                                    const Text(
                                      "Sign In",
                                      style: TextStyle(
                                          fontSize: 34, fontFamily: "Poppins"),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                      child: Text(
                                        "Access to 240+ hours pf content. Learn design and code, by building real apps with Flutter and Swift",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SignInForm()
                                  ],
                                ),
                              ),
                            ),
                          ));
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                    "Purcahse includes access to 30+ courses,240+ premium tutorials, 120+hours of videso, source files and certificates"),
              ),
            ],
          ),
        ))
      ]),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Email",
          style: TextStyle(color: Colors.black54),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset("assets/icons/email.svg"),
            )),
          ),
        ),
        const Text(
          "Password",
          style: TextStyle(color: Colors.black54),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset("assets/icons/password.svg"),
            )),
          ),
        ),
      ],
    ));
  }
}
