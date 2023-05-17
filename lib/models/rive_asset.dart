import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachine, title, src;
  late SMIBool? input;
  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachine,
      required this.title,
      this.input});
  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottonNavs = [
  RiveAsset("assets/RiveAssets/icons.riv",
      artboard: "CHAT", stateMachine: "CHAT_Interactivity", title: "Chat"),
  RiveAsset("assets/RiveAssets/icons.riv",
      artboard: "SEARCH",
      stateMachine: "SEARCH_Interactivity",
      title: "Search"),
  RiveAsset("assets/RiveAssets/icons.riv",
      artboard: "TIMER", stateMachine: "TIMER_Interactivity", title: "Timer"),
  RiveAsset("assets/RiveAssets/icons.riv",
      artboard: "BELL",
      stateMachine: "BELL_Interactivity",
      title: "Notifications"),
  RiveAsset("assets/RiveAssets/icons.riv",
      artboard: "USER", stateMachine: "USER_Interactivity", title: "Profile"),
];
