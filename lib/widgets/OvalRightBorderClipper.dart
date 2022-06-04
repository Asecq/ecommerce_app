import 'package:flutter/material.dart';

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var curYPos = 0.0;
    var curXPos = 0.0;
    var increment = size.height / 30;
    while (curYPos < size.height) {
      curYPos += increment;
      curXPos = curXPos == 0.0 ? 6.0 : 0.0;
      path.lineTo(curXPos, curYPos);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}