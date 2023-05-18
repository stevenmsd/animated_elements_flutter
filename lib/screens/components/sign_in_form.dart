import 'package:animated_elements/screens/entry_poin.dart';
import 'package:animated_elements/utils/rive_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'package:flutter/src/painting/gradient.dart' as gradiente;

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isShowLoading = false;
  bool isShowConfetti = false;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  late SMITrigger confetti;

  void signIn(BuildContext context) {
    setState(() {
      isShowLoading = true;
      isShowConfetti = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (_formkey.currentState!.validate()) {
        check.fire();
        Future.delayed(
          const Duration(seconds: 2),
          () {
            setState(() {
              isShowLoading = false;
            });

            confetti.fire();
            Future.delayed(Duration(seconds: 1), () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EntryPoint()));
            });
          },
        );
      } else {
        error.fire();
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isShowLoading = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
            key: _formkey,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "";
                      }
                      return null;
                    },
                    onSaved: (email) {},
                    decoration: const InputDecoration(
                        prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Image(
                        image: AssetImage("assets/icons/email.png"),
                      ),
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "";
                      }
                      return null;
                    },
                    onSaved: (password) {},
                    obscureText: true,
                    decoration: const InputDecoration(
                        prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Image(
                              image: AssetImage("assets/icons/password.png"),
                            ))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 24),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                        gradient: gradiente.LinearGradient(colors: [
                          Color(0xFF7266DD),
                          /* Color(0xFF134AD1), */
                          Color(0xFF01D6EB),
                          /* Color(0xFF1CBAE7), */
                          //add more colors
                        ]),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color.fromRGBO(
                                  0, 0, 0, 0.25), //shadow for button
                              blurRadius: 6,
                              offset: Offset(2, 3)) //blur radius of shadow
                        ]),
                    child: ElevatedButton.icon(
                        onPressed: () {
                          signIn(context);
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          minimumSize: const Size(double.infinity, 56),
                        ),
                        icon: const Icon(
                          CupertinoIcons.arrow_right,
                          /* color: Color(0xFFFE0037), */
                        ),
                        label: const Text("Inciar Sesión")),
                  ),
                )
                /*  Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 24),
                  child: ElevatedButton.icon(
                      onPressed: () {
                        signIn(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF77D8E),
                          minimumSize: const Size(double.infinity, 56),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          ))),
                      icon: const Icon(
                        CupertinoIcons.arrow_right,
                        color: Color(0xFFFE0037),
                      ),
                      label: const Text("Inciar Sesión")),
                ) */
              ],
            )),
        isShowLoading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                  "assets/RiveAssets/check.riv",
                  onInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard);
                    check = controller.findSMI("Check") as SMITrigger;
                    error = controller.findSMI("Error") as SMITrigger;
                    reset = controller.findSMI("Reset") as SMITrigger;
                  },
                ),
              )
            : const SizedBox(),
        isShowConfetti
            ? CustomPositioned(
                child: Transform.scale(
                scale: 7,
                child: RiveAnimation.asset(
                  "assets/RiveAssets/confetti.riv",
                  onInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard);
                    confetti =
                        controller.findSMI("Trigger explosion") as SMITrigger;
                  },
                ),
              ))
            : const SizedBox()
      ],
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.child, this.size = 100});
  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Column(
      children: [
        const Spacer(),
        SizedBox(
          height: size,
          width: size,
          child: child,
        ),
        const Spacer(
          flex: 2,
        )
      ],
    ));
  }
}
