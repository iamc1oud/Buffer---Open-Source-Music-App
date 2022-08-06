import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final audioPlayerService =
    ChangeNotifierProvider((ref) => AudioPlayerService());

class AudioPlayerService extends ChangeNotifier {
  final player = AudioPlayer();

  // Song duration
  Duration? duration;

  set setDuration(Duration? value) {
    duration = value;
    notifyListeners();
  }

  // Play single music
  Future play(String url) async {
    if (player.playing) {
      player.stop();
    }

    final duration = await player.setUrl(url);
    setDuration = duration;
    player.play();
  }
}
