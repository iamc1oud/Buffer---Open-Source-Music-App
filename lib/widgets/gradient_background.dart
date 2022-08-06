import 'package:buffer/core/theming/theming_globals.dart';
import 'package:flutter/material.dart';

class LinearGradientBackground extends StatelessWidget {
  const LinearGradientBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: mediaQuery.size.height * 0.1,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Colors.black])));
  }
}
