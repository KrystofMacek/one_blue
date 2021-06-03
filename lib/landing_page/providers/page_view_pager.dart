import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageViewController =
    StateNotifierProvider<PageViewController, PageController>(
        (ref) => PageViewController());

class PageViewController extends StateNotifier<PageController> {
  PageViewController() : super(PageController());

  @override
  set state(PageController value) {
    super.state = value;
  }

  void nextPage() =>
      state.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOut);
  void previousPage() => state.previousPage(
      duration: Duration(seconds: 1), curve: Curves.easeInOut);
}
