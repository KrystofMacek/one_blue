import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:one_blue/common/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_blue/landing_page/providers/page_view_pager.dart';

class Controlls extends StatelessWidget {
  const Controlls({Key key, Size size})
      : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    double _translateHeight = (_size.height * .26);
    // if (_size.width < 1400 && _size.width >= 1100) {
    //   _translateHeight = (_size.height * .23);
    // }

    return Transform(
      transform: Matrix4.identity()..translate(0, _translateHeight),
      child: Align(
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 650),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform(
                origin:
                    Offset((_size.width * .05 / 2), (_size.width * .05 / 4)),
                transform: Matrix4.skewX(-60),
                child: ButtonLeft(
                  size: _size,
                  isForward: false,
                ),
              ),
              Transform(
                origin:
                    Offset((_size.width * .05 / 2), (_size.width * .05 / 4)),
                transform: Matrix4.skewX(-60),
                child: ButtonLeft(
                  size: _size,
                  isForward: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonLeft extends StatefulWidget {
  const ButtonLeft({
    Key key,
    @required Size size,
    @required bool isForward,
  })  : _size = size,
        _isForward = isForward,
        super(key: key);

  final Size _size;
  final bool _isForward;

  @override
  _ButtonLeftState createState() => _ButtonLeftState();
}

class _ButtonLeftState extends State<ButtonLeft>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    double _width = widget._size.width;

    double _sizeMajor = 60;
    double _sizeMinor = 40;

    if (_width < 1100 && _width >= 800) {
      _sizeMajor = 50;
      _sizeMinor = 35;
    } else if (_width < 800 && _width >= 500) {
      _sizeMajor = 40;
      _sizeMinor = 30;
    } else if (_width < 500) {
      _sizeMajor = 30;
      _sizeMinor = 25;
    }

    bool isPortrait = (widget._size.width < widget._size.height);
    bool isTablet = (isPortrait && widget._size.width > 750);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          child: MaterialButton(
            onPressed: () {
              widget._isForward
                  ? context.read(pageViewController.notifier).nextPage()
                  : context.read(pageViewController.notifier).previousPage();
            },
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform(
                  transform: Matrix4.identity()
                    ..translate(
                        widget._isForward ? 0 : _animationController.value * 5),
                  child: Icon(
                    widget._isForward
                        ? Icons.arrow_forward_ios_rounded
                        : Icons.arrow_back_ios_rounded,
                    color: CustomColors.fullTorq,
                    size: widget._isForward ? _sizeMinor : _sizeMajor,
                  ),
                ),
                Transform(
                  transform: Matrix4.identity()
                    ..translate(widget._isForward
                        ? _animationController.value * -5
                        : 0),
                  child: Icon(
                    widget._isForward
                        ? Icons.arrow_forward_ios_rounded
                        : Icons.arrow_back_ios_rounded,
                    color: CustomColors.fullTorq,
                    size: widget._isForward ? _sizeMajor : _sizeMinor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
