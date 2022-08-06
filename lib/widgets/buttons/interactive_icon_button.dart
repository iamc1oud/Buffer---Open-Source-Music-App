import 'package:flutter/material.dart';

class InteractiveIconButton extends StatefulWidget {
  VoidCallback? callback;
  IconButton icon;

  InteractiveIconButton({Key? key, this.callback, required this.icon})
      : super(key: key);

  @override
  _InteractiveIconButtonState createState() => _InteractiveIconButtonState();
}

class _InteractiveIconButtonState extends State<InteractiveIconButton>
    with SingleTickerProviderStateMixin {
  double? _scale;
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller!.value;
    return _animatedButton();
  }

  Widget _animatedButton() {
    return Container(
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.green,
        ),
        child: widget.icon);
  }

  void _tapDown(TapDownDetails details) {
    _controller?.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller?.reverse();
  }
}
