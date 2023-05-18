import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'sign_in_form.dart';

Future<Object?> customSignInDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Sign In",
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (_, animation, __, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      pageBuilder: (context, _, __) => Center(
            child: Container(
              height: 550,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              padding: const EdgeInsets.only(
                  top: 32, left: 24, right: 24, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.94),
                borderRadius: const BorderRadius.all(Radius.circular(40)),
              ),
              child: Card(
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Inciar Sesión",
                          style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
                        ),
                        const SignInForm(),
                        Row(
                          children: const [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Text(
                                "O",
                                style: TextStyle(color: Colors.black26),
                              ),
                            ),
                            Expanded(child: Divider())
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  "assets/icons/email_box.svg",
                                  height: 64,
                                  width: 64,
                                )),
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  "assets/icons/apple_box.svg",
                                  height: 64,
                                  width: 64,
                                )),
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: const Image(
                                image:
                                    AssetImage("assets/icons/google_box.png"),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text("No tiene una cuenta."),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                    color: Color(0xFF01D6EB),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text('Registrese.'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Positioned(
                      left: 0,
                      right: 0,
                      bottom: -60,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )).then(onClosed);
}
