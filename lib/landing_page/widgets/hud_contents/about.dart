import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_blue/common/colors.dart';
import 'package:one_blue/landing_page/content/hud_contents.dart';
import 'package:one_blue/landing_page/providers/animations.dart';
import 'package:one_blue/landing_page/providers/hud_pager.dart';

class AboutPageContent extends StatelessWidget {
  const AboutPageContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read(portraitOpacityAnimationProvider.notifier).startAnimtion();

    Size _size = MediaQuery.of(context).size;

    double _titleFS = 40;
    double _contentFS = 24;
    double _imageSize = 200;
    bool _animateText = true;
    if (_size.width < 1100) {
      _titleFS = 30;
      _contentFS = 18;
      _imageSize = 120;
      _animateText = false;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'About',
              style: TextStyle(
                fontFamily: 'Neuropol',
                fontSize: _titleFS,
                color: Colors.white60,
                shadows: [
                  Shadow(
                    color: Colors.white,
                    blurRadius: 2,
                  )
                ],
              ),
            ),
          ],
        ),
        Consumer(
          builder: (context, watch, child) {
            double _opacityAnimationValue =
                watch(portraitOpacityAnimationProvider);
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: .8 * _opacityAnimationValue,
                  child: Image.asset(
                    'assets/images/portrait.png',
                    height: _imageSize,
                  ),
                ),
              ],
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
        _animateText
            ? AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TypewriterAnimatedText(
                    ABOUT,
                    textStyle: TextStyle(
                      height: 1.6,
                      fontFamily: 'Orbitron',
                      fontSize: _contentFS,
                      color: Colors.white60,
                      letterSpacing: 2.5,
                      shadows: [
                        Shadow(
                          color: Colors.white,
                          blurRadius: 1,
                        )
                      ],
                    ),
                    speed: Duration(milliseconds: 15),
                  )
                ],
              )
            : Text(
                ABOUT,
                style: TextStyle(
                  height: 1.6,
                  fontFamily: 'Orbitron',
                  fontSize: _contentFS,
                  color: Colors.white60,
                  letterSpacing: 2.5,
                  shadows: [
                    Shadow(
                      color: Colors.white,
                      blurRadius: 1,
                    )
                  ],
                ),
              ),
      ],
    );
  }
}
