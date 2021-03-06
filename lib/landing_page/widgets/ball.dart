import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:one_blue/common/colors.dart';
import 'package:one_blue/landing_page/providers/animations.dart';
import 'package:one_blue/landing_page/providers/page_view_pager.dart';

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

    double _diameter = 370;
    if (_size.width < 1400 && _size.width >= 1100) {
      _diameter = 300;
    } else if (_size.width < 1100 && _size.width >= 800) {
      _diameter = 250;
    } else if (_size.width < 800 && _size.width >= 500) {
      _diameter = 210;
    } else if (_size.width < 500 && _size.width >= 400) {
      _diameter = 190;
    } else if (_size.width < 400) {
      _diameter = 160;
    }

    // double _diameter;
    // if (_size.width > _size.height) {
    //   _diameter = _size.width * .2;
    // } else {
    //   _diameter = _size.width * .7;
    // }
    // if (_size.width - _size.height < 250 && _size.width - _size.height > -250) {
    //   _diameter = _size.width * .4;
    // }

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
                -1,
                .6,
                12,
              ],
              colors: [
                Colors.black26,
                Colors.white24,
                CustomColors.shinyBlue,
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

    double _diameter = 370;
    if (_size.width < 1400 && _size.width >= 1100) {
      _diameter = 300;
    } else if (_size.width < 1100 && _size.width >= 800) {
      _diameter = 250;
    } else if (_size.width < 800 && _size.width >= 500) {
      _diameter = 210;
    } else if (_size.width < 500 && _size.width >= 400) {
      _diameter = 190;
    } else if (_size.width < 400) {
      _diameter = 160;
    }
    // double _diameter;
    // if (_size.width > _size.height) {
    //   _diameter = _size.width * .2;
    // } else {
    //   _diameter = _size.width * .7;
    // }
    // if (_size.width - _size.height < 250 && _size.width - _size.height > -250) {
    //   _diameter = _size.width * .4;
    // }

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
                color: CustomColors.whiteBlue,
                blurRadius: 15,
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
