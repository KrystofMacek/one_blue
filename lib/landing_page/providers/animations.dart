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
      duration: Duration(seconds: 2),
    );
    _animationController.addListener(() {
      state = _animationController.value;
    });
  }

  void startAnimtion() => _animationController.repeat();
}

final buttonEffectAnimationProvider =
    StateNotifierProvider<ButtonEffectAnimation, double>(
        (ref) => ButtonEffectAnimation());

class ButtonEffectAnimation extends StateNotifier<double> {
  ButtonEffectAnimation() : super(0);

  AnimationController _animationController;

  void init(TickerProvider vsync) {
    _animationController = AnimationController(
      vsync: vsync,
      duration: Duration(seconds: 15),
      reverseDuration: Duration(seconds: 10),
      animationBehavior: AnimationBehavior.preserve,
    );
    _animationController.addListener(() {
      state = _animationController.value;
    });
  }

  void startAnimtion() => _animationController.repeat(reverse: true);
}

final contactButtonHoverEffectAnimationProvider =
    StateNotifierProvider<ContactButtonHoverEffectAnimation, double>(
        (ref) => ContactButtonHoverEffectAnimation());

class ContactButtonHoverEffectAnimation extends StateNotifier<double> {
  ContactButtonHoverEffectAnimation() : super(0);

  AnimationController _animationController;

  void init(TickerProvider vsync) {
    _animationController = AnimationController(
      vsync: vsync,
      duration: Duration(seconds: 8),
      reverseDuration: Duration(seconds: 4),
      animationBehavior: AnimationBehavior.preserve,
    );
    _animationController.addListener(() {
      state = _animationController.value;
    });
  }

  void pause() => _animationController.stop();
  void resume() => _animationController.repeat(reverse: true);
}

final aboutButtonHoverEffectAnimationProvider =
    StateNotifierProvider<AboutButtonHoverEffectAnimation, double>(
        (ref) => AboutButtonHoverEffectAnimation());

class AboutButtonHoverEffectAnimation extends StateNotifier<double> {
  AboutButtonHoverEffectAnimation() : super(0);

  AnimationController _animationController;

  void init(TickerProvider vsync) {
    _animationController = AnimationController(
      vsync: vsync,
      duration: Duration(seconds: 8),
      reverseDuration: Duration(seconds: 4),
      animationBehavior: AnimationBehavior.preserve,
    );
    _animationController.addListener(() {
      state = _animationController.value;
    });
  }

  void pause() => _animationController.stop();
  void resume() => _animationController.repeat(reverse: true);
}
