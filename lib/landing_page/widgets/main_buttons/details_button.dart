import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;

import 'package:one_blue/common/colors.dart';
import 'package:one_blue/landing_page/providers/animations.dart';
import 'package:one_blue/landing_page/providers/hud_pager.dart';

class DetailsButton extends ConsumerWidget {
  const DetailsButton({
    Key key,
    @required double diameter,
    @required double animationValue,
  })  : _diameter = diameter,
        _animationValue = animationValue,
        super(key: key);

  final double _diameter;
  final double _animationValue;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    double _animationHoverValue =
        watch(aboutButtonHoverEffectAnimationProvider);
    return MouseRegion(
      onEnter: (event) => context
          .read(aboutButtonHoverEffectAnimationProvider.notifier)
          .resume(),
      onExit: (event) => context
          .read(aboutButtonHoverEffectAnimationProvider.notifier)
          .pause(),
      child: MaterialButton(
        elevation: 0,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        minWidth: 0,
        onPressed: () {
          if (context
              .read(hudSlideInAnimationProvider.notifier)
              .getOpenState()) {
            if (context.read(hudPagerProvider.notifier).state != 3) {
              context.read(hudPagerProvider.notifier).openDetailsHud();
            }
          } else {
            context.read(hudSlideInAnimationProvider.notifier).play(3);
          }
        },
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          width: _diameter,
          height: _diameter,
          child: Stack(
            children: [
              Transform(
                origin: Offset(_diameter / 2, _diameter / 2),
                transform: Matrix4.identity()
                  ..rotateZ((math.pi * 2) * _animationValue),
                child: Align(
                  alignment: Alignment.center,
                  child: DashedContainer(
                    dashColor: CustomColors.whiteBlue,
                    strokeWidth: 4,
                    dashedLength: _diameter / 4,
                    boxShape: BoxShape.circle,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.backgroundLight,
                            spreadRadius: 5,
                            blurRadius: 7,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Transform(
                origin: Offset(_diameter / 2, _diameter / 2),
                transform: Matrix4.identity()
                  ..rotateZ((math.pi * 2) * (-_animationHoverValue / 2.2)),
                child: Align(
                  alignment: Alignment.center,
                  child: DashedContainer(
                    dashColor: CustomColors.fullTorq,
                    strokeWidth: 4,
                    dashedLength: _diameter / 5,
                    boxShape: BoxShape.circle,
                    child: Container(
                      width: _diameter - 10,
                      height: _diameter - 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
              Transform(
                origin: Offset(_diameter / 2, _diameter / 2),
                transform: Matrix4.identity(),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: _diameter - 30,
                    height: _diameter - 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.more_horiz,
                      size: _diameter * .5,
                      color: CustomColors.whiteBlue.withOpacity(.8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
