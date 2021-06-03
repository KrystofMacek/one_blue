import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_blue/landing_page/providers/animations.dart';
import 'package:one_blue/landing_page/providers/details_pager.dart';
import 'package:one_blue/landing_page/widgets/hud_contents/details_contents.dart';

class DetailsPageContent extends ConsumerWidget {
  const DetailsPageContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    context.read(portraitOpacityAnimationProvider.notifier).startAnimtion();

    int contentId = watch(detailsPagerProvider);

    return DetailsContents(
      contentId: contentId,
    );
  }
}
