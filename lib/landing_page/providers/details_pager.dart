import 'package:flutter_riverpod/flutter_riverpod.dart';

final detailsPagerProvider =
    StateNotifierProvider<DetailsPager, int>((ref) => DetailsPager());

class DetailsPager extends StateNotifier<int> {
  DetailsPager() : super(1);

  int get state;

  void updateContentId(int contentId) => state = contentId;
}
