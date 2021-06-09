import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:one_blue/common/colors.dart';
import 'package:one_blue/common/const.dart';
import 'package:one_blue/landing_page/providers/animations.dart';
import 'package:one_blue/landing_page/providers/content_pager.dart';
import 'package:one_blue/landing_page/widgets/main_buttons/about_button.dart';
import 'package:one_blue/landing_page/widgets/main_buttons/contact_button.dart';
import 'package:one_blue/landing_page/widgets/main_buttons/details_button.dart';

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
      transform: Matrix4.identity()..translate(-_size.width * .16),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: _size.height * .18,
            ),
            Text(
              'Contact',
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
            Container(
              height: 20,
            ),
            ContactButton(
              diameter: _diameter,
              animationValue: _animationValue,
            ),
            Container(
              height: _size.height * .1,
            ),
            Text(
              'About',
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
            Container(
              height: 20,
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
        } else if (_contentPage >= 2.5 && _contentPage < 3.5) {
          label = PROJECT_LABELS[2];
        } else if (_contentPage >= 3.5 && _contentPage < 4.5) {
          label = PROJECT_LABELS[3];
        }

        if (watch(showDetailsButton)) {
          return Transform(
            transform: Matrix4.identity()..translate(_size.width * .16),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: (_size.height * .18 - 40) + (_size.height * .1),
                  ),
                  Column(
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
                      Container(
                        height: 20,
                      ),
                      DetailsButton(
                        diameter: _diameter,
                        animationValue: _animationValue,
                      ),
                    ],
                  )
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
