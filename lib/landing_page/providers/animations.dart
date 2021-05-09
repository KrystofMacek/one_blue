import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final levitationAnimationProvider =
    StateNotifierProvider<LevitationAnimation, double>(
        (ref) => LevitationAnimation());

class LevitationAnimation extends StateNotifier<double> {
  LevitationAnimation() : super(0);

  AnimationController _animationController;

  void init(TickerProvider vsync) {
    _animationController = AnimationController(
      vsync: vsync,
      duration: Duration(seconds: 2),
    );
    _animationController.addListener(() {
      state = _animationController.value;
    });
  }

  void startAnimtion() => _animationController.repeat(reverse: true);
}

final scannerAnimationProvider =
    StateNotifierProvider<ScannerAnimation, double>(
        (ref) => ScannerAnimation());

class ScannerAnimation extends StateNotifier<double> {
  ScannerAnimation() : super(0);

  AnimationController _animationController;

  void init(TickerProvider vsync) {
    _animationController = AnimationController(
      vsync: vsync,
      duration: Duration(seconds: 6),
    );
    _animationController.addListener(() {
      state = _animationController.value;
    });
  }

  void startAnimtion() => _animationController.repeat();
}
