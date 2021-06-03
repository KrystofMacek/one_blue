import 'package:flutter_riverpod/flutter_riverpod.dart';

final hudPagerProvider =
    StateNotifierProvider<HudPager, int>((ref) => HudPager());

class HudPager extends StateNotifier<int> {
  HudPager() : super(0);

  int get state;

  void closeHud() => state = 0;
  void openContactHud() => state = 1;
  void openAboutHud() => state = 2;
  void openDetailsHud() => state = 3;
  void open(int content) => state = content;
}
