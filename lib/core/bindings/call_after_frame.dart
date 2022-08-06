import 'package:flutter/material.dart';

callAfterFrame(VoidCallback? callback) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    callback?.call();
  });
}
