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
    double _width = _size.width * .1;
    double _scannerAnimation = watch(scannerAnimationProvider);
    return Stack(
      children: [
        // Transform(
        //   origin: Offset(_width * 1.2 / 2, _width * 1.2 / 2),
        //   transform: Matrix4.identity()
        //     ..setEntry(2, 3, 0.001)
        //     ..translate(0, (_size.height * .45) + 20)
        //     ..rotateX(math.pi / 3),
        //   child: Align(
        //     alignment: Alignment.center,
        //     child: Container(
        //       decoration: BoxDecoration(
        //         gradient: LinearGradient(
        //           colors: [
        //             Colors.grey[700],
        //             Colors.grey[400],
        //             Colors.grey[700],
        //           ],
        //         ),
        //         // boxShadow: [
        //         //   BoxShadow(
        //         //       color: Colors.blueGrey, blurRadius: 40, spreadRadius: 25)
        //         // ],
        //         shape: BoxShape.circle,
        //       ),
        //       width: _width * 1.2,
        //       height: _width * 1.2,
        //     ),
        //   ),
        // ),
        // Transform(
        //   origin: Offset(_width * 1.2 / 2, _width * 1.2 / 2),
        //   transform: Matrix4.identity()
        //     ..setEntry(2, 3, 0.001)
        //     ..translate(0, (_size.height * .45) + 5)
        //     ..rotateX(math.pi / 3),
        //   child: Align(
        //     alignment: Alignment.center,
        //     child: Container(
        //       decoration: BoxDecoration(
        //         gradient: LinearGradient(
        //           colors: [
        //             Colors.grey[700],
        //             Colors.grey[400],
        //             Colors.grey[700],
        //           ],
        //         ),
        //         // boxShadow: [
        //         //   BoxShadow(
        //         //       color: Colors.lightBlue, blurRadius: 5, spreadRadius: 10)
        //         // ],
        //       ),
        //       width: _width * 1.2,
        //       height: 50,
        //     ),
        //   ),
        // ),
        Transform(
          origin: Offset(_width * 1.1 / 2, _width * 1.1 / 2),
          transform: Matrix4.identity()
            ..setEntry(2, 3, 0.001)
            ..translate(0, (_size.height * .45))
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
            ..translate(0, (_size.height * .45))
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
