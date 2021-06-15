import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:one_blue/common/colors.dart';

class HeadingName extends StatelessWidget {
  const HeadingName({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    double _fontSizeMain;
    double _fontSizeMinor;

    if (_size.width > _size.height) {
      _fontSizeMain = 60;
      _fontSizeMinor = 20;
    } else {
      _fontSizeMain = 35;
      _fontSizeMinor = 18;
    }
    return Align(
      alignment: Alignment.bottomCenter,
      child: Transform(
        transform: Matrix4.identity()..translate(0, -30),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'ONE BLUE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Neuropol',
                  fontSize: _fontSizeMain,
                  color: Colors.white60,
                  shadows: [
                    Shadow(
                      color: Colors.white,
                      blurRadius: 2,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: AutoSizeText(
                  'Flutter | Mobile app development',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Neuropol',
                    fontSize: _fontSizeMinor,
                    color: CustomColors.fullTorq,
                    shadows: [
                      Shadow(
                        color: CustomColors.fullTorq.withOpacity(.6),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      )
                    ],
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
