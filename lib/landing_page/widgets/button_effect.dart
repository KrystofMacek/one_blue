import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;

import 'package:one_blue/common/colors.dart';
import 'package:one_blue/common/const.dart';
import 'package:one_blue/landing_page/providers/animations.dart';
import 'package:one_blue/landing_page/providers/content_pager.dart';
import 'package:one_blue/landing_page/providers/hud_pager.dart';

class ButtonCol extends ConsumerWidget {
  const ButtonCol({Key key, Size size})
      : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    double _diameter = (_size.width * .04).clamp(80, 200);

    double _animationValue = watch(buttonEffectAnimationProvider);

    return Transform(
      transform: Matrix4.identity()..translate(20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ContactButton(
              diameter: _diameter,
              animationValue: _animationValue,
            ),
            AboutButton(
              diameter: _diameter,
              animationValue: _animationValue,
            ),
          ],
        ),
      ),
    );
  }
}

class ContactButton extends ConsumerWidget {
  const ContactButton({
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
        watch(contactButtonHoverEffectAnimationProvider);
    return MouseRegion(
      onEnter: (event) => context
          .read(contactButtonHoverEffectAnimationProvider.notifier)
          .resume(),
      onExit: (event) => context
          .read(contactButtonHoverEffectAnimationProvider.notifier)
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
            if (context.read(hudPagerProvider.notifier).state != 2) {
              context.read(hudPagerProvider.notifier).openAboutHud();
            }
          } else {
            context.read(hudSlideInAnimationProvider.notifier).play(2);
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
                      Icons.mail_outline,
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

class AboutButton extends ConsumerWidget {
  const AboutButton({
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
            if (context.read(hudPagerProvider.notifier).state != 1) {
              context.read(hudPagerProvider.notifier).openContactHud();
            }
          } else {
            context.read(hudSlideInAnimationProvider.notifier).play(1);
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
                      Icons.person_outline,
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

class DetailsButtonCol extends StatelessWidget {
  const DetailsButtonCol({Key key, Size size})
      : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    double _diameter = (_size.width * .04).clamp(80, 200);

    return Consumer(
      builder: (context, watch, child) {
        double _animationValue = watch(buttonEffectAnimationProvider);
        double _contentPage = watch(currentPage);

        String label = '';
        if (_contentPage >= .5 && _contentPage < 1.5) {
          label = PROJECT_LABELS[0];
        } else if (_contentPage >= 1.5 && _contentPage < 2.5) {
          label = PROJECT_LABELS[1];
        }

        if (watch(showDetailsButton)) {
          return Transform(
            transform: Matrix4.identity()..translate(-20),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          fontFamily: 'Neuropol',
                          fontSize: 20,
                          color: CustomColors.whiteBlue,
                          shadows: [
                            Shadow(
                              color: CustomColors.whiteBlue,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DetailsButton(
                        diameter: _diameter,
                        animationValue: _animationValue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}

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
