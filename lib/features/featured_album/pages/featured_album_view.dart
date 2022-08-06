import 'package:buffer/core/bindings/call_after_frame.dart';
import 'package:buffer/features/featured_album/pages/album_songs_view.dart';
import 'package:buffer/features/featured_album/providers/feature_album_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/dimensions.dart';
import '../../../core/theming/theming_globals.dart';
import '../../../widgets/load_image_widget.dart';
import '../../../widgets/pallet_generator.dart';
import '../../audio_player_control/pages/audio_player_control_view.dart';
import '../../featured_playlist/pages/widgets/playlist_actions.dart';

class FeaturedAlbumView extends ConsumerStatefulWidget {
  String albumId;

  FeaturedAlbumView({Key? key, required this.albumId}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FeaturedAlbumViewState();
}

class _FeaturedAlbumViewState extends ConsumerState<FeaturedAlbumView> {
  FeaturedAlbumController? playlist;

  @override
  void initState() {
    callAfterFrame(() {
      playlist?.load(widget.albumId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    playlist = ref.watch(featuredAlbumController);

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
                            url: playlist?.albumList?.image?.last.link),
                      ),
                    ),
                    kMediumHeight,
                    Text(
                      '${playlist?.albumList?.name?.replaceAll('&quot;', '')}',
                      style: textTheme.headline5
                          ?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                    Text(
                      'by ${playlist?.albumList?.primaryArtist}',
                      style: textTheme.caption,
                    ),
                    kSmallHeight,
                    Text(
                      '${playlist?.albumList?.songCount} Songs',
                      style: textTheme.caption,
                    )
                  ],
                ),
              ]),
              const PlaylistActions(),
              const AlbumSongsView(),
              kBottomViewInset
            ],
          ),
        ],
      ),
      bottomSheet: const AudioPlayerControlView(),
    );
  }
}
