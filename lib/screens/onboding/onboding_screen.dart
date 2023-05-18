import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../components/animated_btn.dart';
import '../components/custom_sign_in_dialog.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInDialogShown = false;
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
        AnimatedPositioned(
          top: isSignInDialogShown ? -50 : -50,
          duration: const Duration(milliseconds: 240),
          height: size.height,
          width: size.width,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                SizedBox(
                  width: 260,
                  child: Column(
                    children: const [
                      Text(
                        "Smart Talk",
                        style: TextStyle(
                            fontSize: 60, fontFamily: "Poppins", height: 1.2),
                      ),
                      Text("Accede a la mejor tecnología")
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

                    Future.delayed(
                      const Duration(milliseconds: 800),
                      () {
                        setState(() {
                          isSignInDialogShown = true;
                        });
                        customSignInDialog(
                          context,
                          onClosed: (_) {
                            isSignInDialogShown = false;
                          },
                        );
                      },
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text("Aprovechale ahora"),
                ),
              ],
            ),
          )),
        )
      ]),
    );
  }
}
