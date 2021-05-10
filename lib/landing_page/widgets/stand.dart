import 'package:flutter/material.dart';
import 'package:one_blue/common/colors.dart';
import 'dart:math' as math;

class Stand extends StatelessWidget {
  const Stand({
    Key key,
    Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    double _width = _size.width;
    return Transform(
      origin: Offset(_width / 2, _width / 2),
      transform: Matrix4.identity()
        ..setEntry(2, 3, 0.001)
        ..rotateX(math.pi / 2)
        ..translate(0, (_size.height / 3.5))
        ..scale(5, 2),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: CustomColors.whiteBlue, width: 2),
            shape: BoxShape.circle,
            gradient: RadialGradient(
              stops: [.2, 1],
              colors: [
                Color(0xff1F3D5F),
                Color(0xff1B1436),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 30,
                blurRadius: 80,
              )
            ],
          ),
          width: _width,
          height: _width,
        ),
      ),
    );
  }
}
