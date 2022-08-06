import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import '../../../core/audio_player/audio_player_service.dart';

class AudioPlayerControlView extends ConsumerStatefulWidget {
  const AudioPlayerControlView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AudioPlayerControlViewState();
}

class _AudioPlayerControlViewState
    extends ConsumerState<AudioPlayerControlView> {
  @override
  Widget build(BuildContext context) {
    var player = ref.watch(audioPlayerService);

    return ClipRRect(
      child: SizedBox(
        height: 120,
        child: StreamBuilder<PlayerState>(
            stream: player.player.playerStateStream,
            builder: (state, snapshot) {
              if (snapshot.hasData) {
                return BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 20.0, sigmaY: 20.0, tileMode: TileMode.mirror),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(CupertinoIcons.repeat),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(CupertinoIcons.back),
                        onPressed: () {},
                      ),
                      snapshot.data?.playing == true
                          ? IconButton(
                              onPressed: () {
                                player.player.pause();
                              },
                              icon: const Icon(CupertinoIcons.pause))
                          : IconButton(
                              onPressed: () {
                                player.player.play();
                              },
                              icon: const Icon(CupertinoIcons.play_arrow)),
                      IconButton(
                        icon: const Icon(CupertinoIcons.forward),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(CupertinoIcons.shuffle),
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              }
              return Container();
            }),
      ),
    );
  }
}
