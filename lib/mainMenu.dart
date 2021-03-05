import 'package:flutter/material.dart';
import 'iconButton.dart';

class MainMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainMenuState();
}

class MainMenuState extends State<MainMenu> {
  bool isHomeTrue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [JelajahIcon('Home', 'assets/icon/pinLoc.jpg', 30)]),
    );
  }
}
