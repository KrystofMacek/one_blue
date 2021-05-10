import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:one_blue/common/colors.dart';

class TopSideLine extends StatelessWidget {
  const TopSideLine({Key key, Size size})
      : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity(),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: _size.width,
          height: 5,
          decoration: BoxDecoration(color: CustomColors.whiteBlue, boxShadow: [
            BoxShadow(
                color: CustomColors.shinyBlue, spreadRadius: 5, blurRadius: 20)
          ]),
        ),
      ),
    );
  }
}
