import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_blue/landing_page/providers/animations.dart';
import 'package:one_blue/landing_page/widgets/background.dart';
import 'package:one_blue/landing_page/widgets/button_effect.dart';
import 'package:one_blue/landing_page/widgets/controlls.dart';
import 'package:one_blue/landing_page/widgets/hud.dart';
import 'package:one_blue/landing_page/widgets/page_view.dart';
import 'package:one_blue/landing_page/widgets/projector.dart';
import 'package:one_blue/landing_page/widgets/headings.dart';
import 'package:one_blue/landing_page/widgets/top_pager_indicator.dart';

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

    context.read(buttonEffectAnimationProvider.notifier).init(this);
    context.read(buttonEffectAnimationProvider.notifier).startAnimtion();

    context.read(contactButtonHoverEffectAnimationProvider.notifier).init(this);
    context.read(aboutButtonHoverEffectAnimationProvider.notifier).init(this);
    context.read(hudSlideInAnimationProvider.notifier).init(this);
    context.read(hudOpenAnimationProvider.notifier).init(this);
    context.read(portraitOpacityAnimationProvider.notifier).init(this);
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
          TopPagerIndicator(size: _size),
          ProjectorPad(size: _size),
          PageViewContent(size: _size),
          Controlls(size: _size),
          HeadingName(),
          ButtonCol(size: _size),
          DetailsButtonCol(size: _size),
          Hud(),
        ],
      ),
    );
  }
}
