import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_blue/landing_page/providers/animations.dart';
import 'package:one_blue/landing_page/providers/content_pager.dart';
import 'package:one_blue/landing_page/providers/details_pager.dart';
import 'package:one_blue/landing_page/widgets/ball.dart';

class MesijiPage extends ConsumerWidget {
  const MesijiPage({
    Key key,
    @required Size size,
    @required int position,
    @required double currentPosition,
  })  : _size = size,
        _position = position,
        _currentPosition = currentPosition,
        super(key: key);

  final Size _size;
  final int _position;
  final double _currentPosition;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    double _levitationValue = watch(levitationAnimationProvider);

    double _diameter = 480;
    if (_size.width < 1400 && _size.width >= 1100) {
      _diameter = 440;
    } else if (_size.width < 1100 && _size.width >= 800) {
      _diameter = 400;
    } else if (_size.width < 800 && _size.width >= 500) {
      _diameter = 340;
    } else if (_size.width < 500 && _size.width >= 400) {
      _diameter = 320;
    } else if (_size.width < 400) {
      _diameter = 300;
    }

    double _diff = _position - _currentPosition;
    double _opacity = 0;
    double _scale = 1;

    double _translateY = 0;

    double _breakpoint = 0.1;

    if (_diff < _breakpoint && _diff > 0) {
      _opacity = (_breakpoint - _diff) / _breakpoint;
      _scale = 1 - _diff;
    } else if (_diff > -_breakpoint && _diff < 0) {
      _opacity = (_breakpoint + _diff) / _breakpoint;
      _scale = 1 + _diff;
      _translateY = -_size.height * _diff;
    } else if (_diff == 0) {
      _opacity = 1;
    }

    _scale.clamp(0.2, 1);
    _opacity.clamp(0, 1);

    return Transform(
      origin: Offset(_size.width / 2, _size.height),
      transform: Matrix4.identity()
        ..scale(_scale)
        ..translate(0, _translateY),
      child: Opacity(
        opacity: _opacity,
        child: Transform(
          transform: Matrix4.identity()
            ..translate(0, (10 * _levitationValue) - (_size.height * .2)),
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/mesiji_preview.png',
                  height: _diameter,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
