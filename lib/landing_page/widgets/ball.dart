import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:one_blue/landing_page/providers/animations.dart';

class OverlayBall extends ConsumerWidget {
  const OverlayBall({
    Key key,
    Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    double _levitationValue = watch(levitationAnimationProvider);

    double _diameter = _size.height * .4;

    return Transform(
      transform: Matrix4.identity()
        ..translate(0, (10 * _levitationValue) - (_size.height * .2)),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: _diameter,
          width: _diameter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                .6,
                10,
              ],
              colors: [
                Colors.white.withOpacity(0),
                Colors.white,
              ],
            ),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class BaseLayerBall extends ConsumerWidget {
  const BaseLayerBall({
    Key key,
    Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    double _levitationValue = watch(levitationAnimationProvider);
    double _diameter = _size.height * .4;

    return Transform(
      transform: Matrix4.identity()
        ..translate(0, (10 * _levitationValue) - (_size.height * .2)),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: _diameter,
          width: _diameter,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 10,
                spreadRadius: 5,
              )
            ],
            gradient: RadialGradient(
              radius: .7,
              stops: [
                .6,
                .8,
              ],
              colors: [
                Colors.blue[700],
                Colors.lightBlue[100],
              ],
            ),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
