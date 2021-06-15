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
import 'package:one_blue/landing_page/widgets/main_buttons/mobile_menu_button.dart';

class ButtonCol extends ConsumerWidget {
  const ButtonCol({Key key, Size size})
      : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    double _diameter = (_size.width * .04).clamp(80, 200);

    double _animationValue = watch(buttonEffectAnimationProvider);

    double translateX = -_size.width * .16;
    bool menuButtons = false;
    if (_size.width < 1400 && _size.width >= 1100) {
      translateX = -_size.width * .20;
    } else if (_size.width < 1100 && _size.width >= 800) {
      translateX = -_size.width * .24;
    } else if (_size.width < 800 && _size.width >= 700) {
      translateX = -_size.width * .3;
    } else if (_size.width < 700) {
      menuButtons = true;
    }

    if (!menuButtons) {
      return Transform(
        transform: Matrix4.identity()..translate(translateX),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: _size.height * .18,
              ),
              Text(
                'CONTACT',
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
                'ABOUT',
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
    } else {
      return SizedBox();
    }
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
        double _animationValueMobile = watch(buttonEffectAnimationProvider);
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

        double translateX = _size.width * .16;
        bool menuButtons = false;
        if (_size.width < 1400 && _size.width >= 1100) {
          translateX = _size.width * .20;
        } else if (_size.width < 1100 && _size.width >= 800) {
          translateX = _size.width * .24;
        } else if (_size.width < 800 && _size.width >= 700) {
          translateX = _size.width * .3;
        } else if (_size.width < 700) {
          _diameter = (_size.width * .04).clamp(60, 200);
          menuButtons = true;
        }

        if (watch(showDetailsButton)) {
          return Transform(
            transform: Matrix4.identity()
              ..translate(menuButtons ? 0 : translateX),
            child: Align(
              alignment: menuButtons ? Alignment.centerRight : Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  menuButtons
                      ? SizedBox()
                      : Container(
                          height:
                              (_size.height * .18 - 40) + (_size.height * .1),
                        ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      menuButtons
                          ? SizedBox()
                          : Text(
                              'APP DETAILS',
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
                      menuButtons
                          ? SizedBox()
                          : Container(
                              height: 20,
                            ),
                      Padding(
                        padding:
                            menuButtons ? EdgeInsets.all(20) : EdgeInsets.zero,
                        child: DetailsButton(
                          diameter: _diameter,
                          animationValue: menuButtons
                              ? _animationValueMobile
                              : _animationValue,
                        ),
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

class MobileMenu extends ConsumerWidget {
  MobileMenu({Key key, Size size})
      : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    double _diameter = (_size.width * .04).clamp(60, 200);
    double _animationValue = watch(buttonEffectAnimationProvider);
    if (_size.width < 700) {
      return Padding(
        padding: EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.topLeft,
          child: MobileMenuButton(
            diameter: _diameter,
            animationValue: _animationValue,
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
