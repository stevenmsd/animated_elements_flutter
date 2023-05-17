import 'package:animated_elements/constants.dart';
import 'package:animated_elements/screens/home/home_screen.dart';
import 'package:animated_elements/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../components/animated_bar.dart';
import '../models/rive_asset.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  RiveAsset selectedBottomNav = bottonNavs.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 12),
        margin: EdgeInsets.only(left: 12, right: 12, bottom: 20),
        decoration: BoxDecoration(
          color: backgroundColor2.withOpacity(0.8),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
                bottonNavs.length,
                (index) => GestureDetector(
                      onTap: () {
                        bottonNavs[index].input!.change(true);
                        if (bottonNavs[index] != selectedBottomNav) {
                          setState(() {
                            selectedBottomNav = bottonNavs[index];
                          });
                        }
                        Future.delayed(const Duration(seconds: 1), () {
                          bottonNavs[index].input!.change(false);
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedBar(
                            isActive: bottonNavs[index] == selectedBottomNav,
                          ),
                          SizedBox(
                            height: 36,
                            width: 36,
                            child: Opacity(
                              opacity: bottonNavs[index] == selectedBottomNav
                                  ? 1
                                  : 0.5,
                              child: RiveAnimation.asset(
                                bottonNavs.first.src,
                                artboard: bottonNavs[index].artboard,
                                onInit: (artboard) {
                                  StateMachineController controller =
                                      RiveUtils.getRiveController(artboard,
                                          stateMachineName:
                                              bottonNavs[index].stateMachine);
                                  bottonNavs[index].input =
                                      controller.findSMI("active") as SMIBool;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
