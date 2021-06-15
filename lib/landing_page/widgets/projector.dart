import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:one_blue/common/colors.dart';
import 'dart:math' as math;

import 'package:one_blue/landing_page/providers/animations.dart';

class ProjectorPad extends ConsumerWidget {
  const ProjectorPad({
    Key key,
    Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // double _width;
    // if (_size.width > _size.height) {
    //   _width = _size.width * .1;
    // } else {
    //   _width = _size.width * .4;
    // }
    // if (_size.width - _size.height < 250 && _size.width - _size.height > -250) {
    //   _width = _width = _size.width * .25;
    // }

    double _width = 250;
    double _translateHeight = (_size.height * .45);
    if (_size.width < 1400 && _size.width >= 1100) {
      _width = 200;
      _translateHeight = (_size.height * .43);
    } else if (_size.width < 1100 && _size.width >= 800) {
      _width = 180;
      _translateHeight = (_size.height * .46);
    } else if (_size.width < 800 && _size.width >= 500) {
      _width = 150;
    } else if (_size.width < 500 && _size.width >= 400) {
      _width = 130;
      _translateHeight = (_size.height * .46);
    } else if (_size.width < 400) {
      _width = 100;
      _translateHeight = (_size.height * .48);
    }

    double _scannerAnimation = watch(scannerAnimationProvider);
    return Stack(
      children: [
        Transform(
          origin: Offset(_width * 1.1 / 2, _width * 1.1 / 2),
          transform: Matrix4.identity()
            ..setEntry(2, 3, 0.001)
            ..translate(0, _translateHeight)
            ..rotateX(math.pi / 3),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  color: CustomColors.whiteBlue,
                  border: Border.all(
                    color: CustomColors.shinyBlue,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: CustomColors.whiteBlue,
                        spreadRadius: 2,
                        blurRadius: 8)
                  ],
                  shape: BoxShape.circle),
              width: _width * 1.2,
              height: _width * 1.2,
            ),
          ),
        ),
        Transform(
          origin: Offset(_width / 2, _width / 2),
          transform: Matrix4.identity()
            ..setEntry(2, 3, 0.001)
            ..translate(0, _translateHeight)
            ..rotateX(math.pi / 3),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                gradient: RadialGradient(
                  stops: [.9, 1.2],
                  colors: [
                    Colors.blue,
                    CustomColors.whiteBlue,
                  ],
                ),
                shape: BoxShape.circle,
              ),
              width: _width,
              height: _width,
              child: Transform(
                origin: Offset(_width / 2, _width / 2),
                transform: Matrix4.identity(),
                // ..rotateZ((math.pi * 2) * _scannerAnimation),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      stops: [
                        1 * _scannerAnimation,
                        1.3 * _scannerAnimation,
                        1.6 * _scannerAnimation,
                      ],
                      colors: [
                        Colors.white.withAlpha(25),
                        Colors.white.withAlpha(90),
                        Colors.white.withAlpha(25),
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                  width: _width,
                  height: _width,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
