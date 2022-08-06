import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AudioPlayerOverlay extends ConsumerStatefulWidget {
  final Widget child;
  const AudioPlayerOverlay({Key? key, required this.child}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AudioPlayerOverlayState();
}

class _AudioPlayerOverlayState extends ConsumerState<AudioPlayerOverlay> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          widget.child,
          const Positioned(bottom: 0, left: 0, right: 0, child: Text('Hello'))
        ],
      ),
    );
  }
}
