import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_blue/common/colors.dart';
import 'package:one_blue/common/const.dart';
import 'package:one_blue/landing_page/providers/content_pager.dart';

class TopPagerIndicator extends ConsumerWidget {
  const TopPagerIndicator({Key key, Size size})
      : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    double _contentPage = watch(currentPage);

    int _highlightedPage = 0;
    if (_contentPage >= .5 && _contentPage < 1.5) {
      _highlightedPage = 1;
    } else if (_contentPage >= 1.5 && _contentPage < 2.5) {
      _highlightedPage = 2;
    } else if (_contentPage >= 2.5 && _contentPage < 3.5) {
      _highlightedPage = 3;
    } else if (_contentPage >= 3.5 && _contentPage < 4.5) {
      _highlightedPage = 4;
    }

    double _hSize = 15;
    double _bSize = 10;
    Color _hColor = Colors.white;
    Color _bColor = Colors.white10;

    return Transform(
      transform: Matrix4.identity(),
      child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 50,
            width: _size.width,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 1,
                    width: _size.width / 4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white, blurRadius: 4, spreadRadius: 1)
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Consumer(
                    builder: (context, watch, child) {
                      List<Widget> pages;
                      return Container(
                        width: _size.width / 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: _highlightedPage == 0 ? _hSize : _bSize,
                              height: _highlightedPage == 0 ? _hSize : _bSize,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    _highlightedPage == 0 ? _hColor : _bColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 4,
                                      spreadRadius: 1)
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: _highlightedPage == 1 ? _hSize : _bSize,
                              height: _highlightedPage == 1 ? _hSize : _bSize,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    _highlightedPage == 1 ? _hColor : _bColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 4,
                                      spreadRadius: 1)
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: _highlightedPage == 2 ? _hSize : _bSize,
                              height: _highlightedPage == 2 ? _hSize : _bSize,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    _highlightedPage == 2 ? _hColor : _bColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 4,
                                      spreadRadius: 1)
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: _highlightedPage == 3 ? _hSize : _bSize,
                              height: _highlightedPage == 3 ? _hSize : _bSize,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    _highlightedPage == 3 ? _hColor : _bColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 4,
                                      spreadRadius: 1)
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: _highlightedPage == 4 ? _hSize : _bSize,
                              height: _highlightedPage == 4 ? _hSize : _bSize,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    _highlightedPage == 4 ? _hColor : _bColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 4,
                                      spreadRadius: 1)
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Transform(
                  transform: Matrix4.identity()..translate(0, 50),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Consumer(
                      builder: (context, watch, child) {
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

                        return Text(
                          label,
                          style: TextStyle(
                            fontFamily: 'Neuropol',
                            fontSize: 18,
                            color: CustomColors.whiteBlue,
                            shadows: [
                              Shadow(
                                color: CustomColors.whiteBlue,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
