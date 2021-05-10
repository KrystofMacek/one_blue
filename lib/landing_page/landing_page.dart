import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_blue/landing_page/providers/animations.dart';
import 'package:one_blue/landing_page/widgets/background.dart';
import 'package:one_blue/landing_page/widgets/ball.dart';
import 'package:one_blue/landing_page/widgets/controlls.dart';
import 'package:one_blue/landing_page/widgets/halving.dart';
import 'package:one_blue/landing_page/widgets/projection_effect.dart';
import 'package:one_blue/landing_page/widgets/projector.dart';
import 'package:one_blue/landing_page/widgets/stand.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read(levitationAnimationProvider.notifier).init(this);
    context.read(levitationAnimationProvider.notifier).startAnimtion();

    context.read(scannerAnimationProvider.notifier).init(this);
    context.read(scannerAnimationProvider.notifier).startAnimtion();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Stack(
        children: [
          Background(size: _size),
          // Stand(size: _size),
          // TopSideLine(size: _size),
          // ProjectorEffect(size: _size),
          ProjectorPad(size: _size),
          BaseLayerBall(size: _size),
          OverlayBall(size: _size),
          Controlls(size: _size),
        ],
      ),
    );
  }
}
