import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_blue/landing_page/providers/hud_pager.dart';

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

final mobileMenuButtonEffectAnimationProvider =
    StateNotifierProvider<MobileMenuButtonHoverEffectAnimationProvider, double>(
        (ref) => MobileMenuButtonHoverEffectAnimationProvider());

class MobileMenuButtonHoverEffectAnimationProvider
    extends StateNotifier<double> {
  MobileMenuButtonHoverEffectAnimationProvider() : super(0);

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

final hudSlideInAnimationProvider =
    StateNotifierProvider<HudSlideInAnimationProvider, double>((ref) =>
        HudSlideInAnimationProvider(
            ref.watch(hudOpenAnimationProvider.notifier)));

class HudSlideInAnimationProvider extends StateNotifier<double> {
  HudSlideInAnimationProvider(HudOpenAnimationProvider hudOpenAnimationProvider)
      : _hudOpenAnimationProvider = hudOpenAnimationProvider,
        super(0);

  HudOpenAnimationProvider _hudOpenAnimationProvider;

  AnimationController _animationController;

  bool _isOpen = false;

  bool getOpenState() => _isOpen;

  void init(TickerProvider vsync) {
    _animationController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 800),
      reverseDuration: Duration(milliseconds: 800),
      animationBehavior: AnimationBehavior.preserve,
    );
    _animationController.addListener(() {
      state = _animationController.value;
    });
  }

  void play(int content) =>
      _animationController.forward().whenCompleteOrCancel(() {
        _isOpen = true;
        _hudOpenAnimationProvider.play(content);
      });

  void reverse() {
    if (_isOpen) {
      _hudOpenAnimationProvider.reverse();
      _animationController.reverse();
      _isOpen = false;
    }
  }
}

final hudOpenAnimationProvider =
    StateNotifierProvider<HudOpenAnimationProvider, double>((ref) =>
        HudOpenAnimationProvider(ref.watch(hudPagerProvider.notifier)));

class HudOpenAnimationProvider extends StateNotifier<double> {
  HudOpenAnimationProvider(HudPager pager)
      : _pager = pager,
        super(0);

  AnimationController _animationController;

  HudPager _pager;

  bool _isOpen = false;

  bool getOpenState() => _isOpen;

  void init(TickerProvider vsync) {
    _animationController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 300),
      reverseDuration: Duration(milliseconds: 200),
      animationBehavior: AnimationBehavior.preserve,
    );
    _animationController.addListener(() {
      state = _animationController.value;
    });
  }

  void play(int content) => _animationController.forward().whenCompleteOrCancel(
        () {
          _isOpen = true;
          _pager.open(content);
        },
      );

  void reverse() {
    if (_isOpen) {
      _animationController.reverse();
      _isOpen = false;
    }
  }
}

final portraitOpacityAnimationProvider =
    StateNotifierProvider<PortraitOpacityAnimation, double>(
        (ref) => PortraitOpacityAnimation());

class PortraitOpacityAnimation extends StateNotifier<double> {
  PortraitOpacityAnimation() : super(0);

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

  void startAnimtion() => _animationController.forward();
}

// MOBILE MENU

final menuMobileOpenAnimationProvider =
    StateNotifierProvider<MenuMobileOpenAnimationProvider, double>(
        (ref) => MenuMobileOpenAnimationProvider());

class MenuMobileOpenAnimationProvider extends StateNotifier<double> {
  MenuMobileOpenAnimationProvider() : super(0);

  AnimationController _animationController;

  void init(TickerProvider vsync) {
    _animationController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 800),
      reverseDuration: Duration(milliseconds: 800),
      animationBehavior: AnimationBehavior.preserve,
    );
    _animationController.addListener(() {
      state = _animationController.value;
    });
  }

  void play() => _animationController.forward();

  void reverse() => _animationController.reverse();
}
