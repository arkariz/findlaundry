import 'package:flutter/material.dart';

//IconButton
class JelajahIcon extends StatelessWidget {
  final String caption;
  final String iconLoc;
  final double iconSize;

  JelajahIcon(this.caption, this.iconLoc, this.iconSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset(iconLoc),
            iconSize: iconSize,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 30,
            child: Text(caption),
          ),
        ],
      ),
    );
  }
}
