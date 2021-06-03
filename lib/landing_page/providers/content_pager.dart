import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentPage =
    StateNotifierProvider<CurrentPage, double>((ref) => CurrentPage());

class CurrentPage extends StateNotifier<double> {
  CurrentPage() : super(0);

  void update(double d) => state = d;
}

final showDetailsButton =
    StateNotifierProvider<ShowDetails, bool>((ref) => ShowDetails());

class ShowDetails extends StateNotifier<bool> {
  ShowDetails() : super(false);

  void update(bool show) => state = show;
}
