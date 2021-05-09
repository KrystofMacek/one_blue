import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_blue/landing_page/landing_page.dart';

void main() {
  runApp(ProviderScope(child: OneBlueWeb()));
}

class OneBlueWeb extends StatelessWidget {
  const OneBlueWeb({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
      },
    );
  }
}
