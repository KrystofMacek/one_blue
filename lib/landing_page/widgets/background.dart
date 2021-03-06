import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:one_blue/common/colors.dart';
import 'dart:math' as math;

class Background extends StatelessWidget {
  const Background({
    Key key,
    Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    double _width = _size.width;
    return Transform(
      transform: Matrix4.identity(),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                CustomColors.background,
                CustomColors.backgroundLight,
                CustomColors.background,
              ],
            ),
          ),
          width: _size.width,
          height: _size.height,
        ),
      ),
    );
  }
}
