import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_blue/landing_page/providers/animations.dart';
import 'package:one_blue/landing_page/providers/content_pager.dart';
import 'package:one_blue/landing_page/providers/details_pager.dart';
import 'package:one_blue/landing_page/widgets/ball.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({
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
        ..scale(_scale)
        ..translate(0, _translateY),
      child: Opacity(
        opacity: _opacity,
        child: Stack(
          children: [
            BaseLayerBall(size: _size),
            OverlayBall(size: _size),
          ],
        ),
      ),
    );
  }
}
