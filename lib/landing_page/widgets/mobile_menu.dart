import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_blue/common/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_blue/landing_page/providers/animations.dart';
import 'package:one_blue/landing_page/providers/hud_pager.dart';

class MobileMenuSheet extends ConsumerWidget {
  MobileMenuSheet({Key key, Size size})
      : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    double _openValue = watch(menuMobileOpenAnimationProvider);
    if (_size.width < 700) {
      return Transform(
        transform: Matrix4.identity()
          ..translate(0, _size.height * (1 - _openValue)),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: IntrinsicHeight(
            child: Stack(
              children: [
                Container(
                  width: _size.width,
                  color: Color(0xff015B7E).withOpacity(.95),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        CloseMenu(),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read(menuMobileOpenAnimationProvider.notifier)
                                .reverse();
                            if (context
                                .read(hudSlideInAnimationProvider.notifier)
                                .getOpenState()) {
                              if (context
                                      .read(hudPagerProvider.notifier)
                                      .state !=
                                  1) {
                                context
                                    .read(hudPagerProvider.notifier)
                                    .openContactHud();
                              }
                            } else {
                              context
                                  .read(hudSlideInAnimationProvider.notifier)
                                  .play(1);
                            }
                          },
                          child: Text(
                            'ABOUT',
                            style: TextStyle(
                              fontFamily: 'Neuropol',
                              fontSize: 30,
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
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read(menuMobileOpenAnimationProvider.notifier)
                                .reverse();
                            if (context
                                .read(hudSlideInAnimationProvider.notifier)
                                .getOpenState()) {
                              if (context
                                      .read(hudPagerProvider.notifier)
                                      .state !=
                                  2) {
                                context
                                    .read(hudPagerProvider.notifier)
                                    .openAboutHud();
                              }
                            } else {
                              context
                                  .read(hudSlideInAnimationProvider.notifier)
                                  .play(2);
                            }
                          },
                          child: Text(
                            'CONTACT',
                            style: TextStyle(
                              fontFamily: 'Neuropol',
                              fontSize: 30,
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
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
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
                  width: _size.width,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}

class CloseMenu extends StatelessWidget {
  const CloseMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          icon: Icon(
            Icons.close,
            size: 40,
            color: Colors.white,
          ),
          onPressed: () {
            context.read(menuMobileOpenAnimationProvider.notifier).reverse();
          },
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
