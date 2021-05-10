import 'package:flutter/material.dart';

import 'dart:ui' as ui;
import 'dart:math' as math;

// class ProjectorEffect extends StatelessWidget {
//   const ProjectorEffect({
//     Key key,
//     Size size,
//   })  : _size = size,
//         super(key: key);

//   final Size _size;

//   @override
//   Widget build(BuildContext context) {
//     return Transform(
//       transform: Matrix4.identity()..setEntry(2, 3, 0.001),
//       child: Align(
//         alignment: Alignment.bottomCenter,
//         child: CustomPaint(
//           size: Size(
//             _size.width * .35,
//             (_size.height * 1.3).toDouble(),
//           ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//           painter: RPSCustomPainter(),
//         ),
//       ),
//     );
//   }
// }

// class RPSCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint_0 = new Paint()
//       ..color = Color.fromARGB(255, 33, 150, 243)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1;

//     Path path_0 = Path();

//     canvas.drawPath(path_0, paint_0);

//     Paint paint_1 = new Paint()
//       ..color = Color.fromARGB(255, 33, 150, 243)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1;
//     paint_1.shader = ui.Gradient.linear(
//       Offset(size.width / 2, size.height),
//       Offset(size.width / 2, 0),
//       [Color(0x24ffffff), Color(0x00ffffff)],
//       [0.00, 1.00],
//     );

//     Path path_1 = Path();
//     path_1.moveTo(size.width * 0.5000000, size.height);
//     path_1.lineTo(0, 0);
//     path_1.lineTo(size.width, 0);
//     path_1.lineTo(size.width * 0.5000000, size.height);
//     path_1.close();

//     canvas.drawPath(path_1, paint_1);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

class ProjectorEffect extends StatelessWidget {
  const ProjectorEffect({
    Key key,
    Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Transform(
      origin: Offset(100, 100),
      transform: Matrix4.identity()

        // ..rotateX(math.pi / 4)
        ..setEntry(3, 1, 0.002)
        ..rotateZ(math.pi / 4),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
      ),
    );
  }
}
