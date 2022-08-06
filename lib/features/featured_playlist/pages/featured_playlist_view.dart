import 'package:buffer/constants/dimensions.dart';
import 'package:buffer/core/bindings/call_after_frame.dart';
import 'package:buffer/core/theming/theming_globals.dart';
import 'package:buffer/features/audio_player_control/pages/audio_player_control_view.dart';
import 'package:buffer/features/featured_playlist/pages/widgets/playlist_actions.dart';
import 'package:buffer/features/featured_playlist/pages/widgets/playlist_songs.dart';
import 'package:buffer/features/featured_playlist/providers/featured_playlist_controller.dart';
import 'package:buffer/widgets/load_image_widget.dart';
import 'package:buffer/widgets/pallet_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeaturePlaylistView extends ConsumerStatefulWidget {
  String? playlistId;

  FeaturePlaylistView({Key? key, this.playlistId}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FeaturePlaylistViewState();
}

class _FeaturePlaylistViewState extends ConsumerState<FeaturePlaylistView> {
  @override
  void initState() {
    callAfterFrame(() {
      // Get pallet of playlist
      playlist?.load(playlistId: widget.playlistId);
    });
    super.initState();
  }

  FeaturePlaylistController? playlist;

  @override
  Widget build(BuildContext context) {
    playlist = ref.watch(featuredPlaylistController);

    if (playlist?.isLoading == true) {
      return const CupertinoActivityIndicator();
    }

    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Pallet(
            image: playlist?.image,
          ),
          ListView(
            shrinkWrap: true,
            children: [
              Stack(alignment: Alignment.center, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(kRadius),
                      child: SizedBox(
                        width: mediaQuery.size.width * 0.4,
                        child: PreviewImage(
                            url: playlist?.featurePlaylistList?.image?[0].link),
                      ),
                    ),
                    kMediumHeight,
                    Text(
                      '${playlist?.featurePlaylistList?.name}',
                      style: textTheme.headline5
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    kSmallHeight,
                    Text(
                      '${playlist?.featurePlaylistList?.songCount} Songs',
                      style: textTheme.caption,
                    )
                  ],
                ),
              ]),
              const PlaylistActions(),
              const PlaylistSongs(),
              kBottomViewInset
            ],
          ),
        ],
      ),
      bottomSheet: const AudioPlayerControlView(),
    );
  }
}
