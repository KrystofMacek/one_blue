import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:one_blue/common/colors.dart';

class HeadingName extends StatelessWidget {
  const HeadingName({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                style: TextStyle(
                  fontFamily: 'Neuropol',
                  fontSize: 60,
                  color: Colors.white60,
                  shadows: [
                    Shadow(
                      color: Colors.white,
                      blurRadius: 2,
                    )
                  ],
                ),
              ),
              Text(
                'Flutter | Mobile app development',
                style: TextStyle(
                  fontFamily: 'Neuropol',
                  fontSize: 20,
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
            ],
          ),
        ),
      ),
    );
  }
}
