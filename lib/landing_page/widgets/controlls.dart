import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:one_blue/common/colors.dart';

class Controlls extends StatelessWidget {
  const Controlls({Key key, Size size})
      : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..translate(0, (_size.height * .25)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(
              origin: Offset((_size.width * .05 / 2), (_size.width * .05 / 4)),
              transform: Matrix4.skewX(-60),
              child: Container(
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(5),
                    // border: Border.all(color: Colors.grey[400], width: 2),
                    // color: Colors.grey[800],
                    ),
                width: _size.width * .05,
                height: (_size.width * .05 / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: CustomColors.shinyBlue,
                      size: (_size.width * .05 / 3),
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      color: CustomColors.shinyBlue,
                      size: (_size.width * .05 / 4),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              width: _size.width * .1,
              color: CustomColors.whiteBlue,
            ),
            Container(
              width: _size.width * .2,
            ),
            Container(
              height: 1,
              width: _size.width * .1,
              color: CustomColors.whiteBlue,
            ),
            Transform(
              origin: Offset((_size.width * .05 / 2), (_size.width * .05 / 4)),
              transform: Matrix4.skewX(-60),
              child: Container(
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(5),
                    // border: Border.all(color: Colors.grey[400], width: 2),
                    // color: Colors.grey[800],
                    ),
                width: _size.width * .05,
                height: (_size.width * .05 / 2),
                child: MaterialButton(
                  elevation: 0,
                  minWidth: 0,
                  hoverColor: Colors.transparent,
                  splashColor: CustomColors.whiteBlue,
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_forward_ios,
                        color: CustomColors.shinyBlue,
                        size: (_size.width * .05 / 4),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: CustomColors.shinyBlue,
                        size: (_size.width * .05 / 3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path_0 = Path();

    canvas.drawPath(path_0, paint_0);

    Paint paint_1 = new Paint()
      ..color = Color.fromARGB(101, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 7.47;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.2500000, 0);
    path_1.lineTo(size.width, 0);
    path_1.lineTo(size.width * 0.7500000, size.height);
    path_1.lineTo(0, size.height);
    path_1.lineTo(size.width * 0.2500000, 0);
    path_1.close();

    canvas.drawPath(path_1, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
