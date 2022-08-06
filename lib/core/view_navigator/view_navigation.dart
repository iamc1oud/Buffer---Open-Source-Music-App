import 'package:buffer/main.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static push(Widget child) {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => child,
      ),
    );
  }
}
