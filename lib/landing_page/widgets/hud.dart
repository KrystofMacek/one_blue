import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_blue/common/colors.dart';
import 'package:one_blue/landing_page/content/hud_contents.dart';
import 'package:one_blue/landing_page/providers/animations.dart';
import 'package:one_blue/landing_page/providers/hud_pager.dart';
import 'package:one_blue/landing_page/widgets/hud_contents/about.dart';
import 'package:one_blue/landing_page/widgets/hud_contents/contact.dart';
import 'package:one_blue/landing_page/widgets/hud_contents/details.dart';

class Hud extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    Size _size = MediaQuery.of(context).size;

    double _hudSlideInAnimationValue = watch(hudSlideInAnimationProvider);
    double _hudOpenAnimationValue = watch(hudOpenAnimationProvider);

    double _baseWidth = _size.width * .8;
    double _baseHeight = _size.height * .9;

    if (_size.width < 1100) {
      _baseWidth = _size.width * .95;
      _baseHeight = _size.height * .95;
    }

    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: _size.width,
          maxHeight: _size.height,
        ),
        child: Stack(
          children: [
            Transform(
              transform: Matrix4.identity()
                ..translate(
                  0,
                  -(_size.height * .7) * (1 - _hudSlideInAnimationValue),
                ),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.whiteBlue,
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, -2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: CustomColors.whiteBlue,
                      ),
                      height: 4,
                      width: _baseWidth + 2,
                    ),
                    Container(
                      width: _baseWidth,
                      height: _baseHeight * _hudOpenAnimationValue,
                      decoration: BoxDecoration(
                        color: Color(0xff015B7E).withOpacity(.95),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: _size.width * .02,
                          vertical: _size.height * .02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CloseHud(),
                          Expanded(
                              child:
                                  SingleChildScrollView(child: HudContent())),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.whiteBlue,
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: CustomColors.whiteBlue,
                      ),
                      height: 4,
                      width: _baseWidth + 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CloseHud extends StatelessWidget {
  const CloseHud({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    double _iconSize = 40;
    if (_size.width < 1100) {
      _iconSize = 28;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
            icon: Icon(
              Icons.close,
              size: _iconSize,
              color: Colors.white,
            ),
            onPressed: () {
              context.read(hudPagerProvider.notifier).closeHud();
              context.read(hudSlideInAnimationProvider.notifier).reverse();
            })
      ],
    );
  }
}

class HudContent extends ConsumerWidget {
  const HudContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    int _page = watch(hudPagerProvider);

    switch (_page) {
      // return About
      case 1:
        return AboutPageContent();
        break;
      // return Contact
      case 2:
        return ContactPageContent();
        break;
      // return Details
      case 3:
        return DetailsPageContent();
        break;
      // return empty
      default:
        return SizedBox();
        break;
    }
  }
}
