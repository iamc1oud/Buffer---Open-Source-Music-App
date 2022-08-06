import 'package:buffer/constants/dimensions.dart';
import 'package:buffer/core/audio_player/audio_player_service.dart';
import 'package:buffer/core/theming/theming_globals.dart';
import 'package:buffer/widgets/load_image_widget.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/feature_playlist_model.dart';
import '../../providers/featured_playlist_controller.dart';

class PlaylistSongs extends ConsumerStatefulWidget {
  const PlaylistSongs({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlaylistSongsState();
}

class _PlaylistSongsState extends ConsumerState<PlaylistSongs> {
  FeaturePlaylistController? playlist;
  AudioPlayerService? player;

  @override
  Widget build(BuildContext context) {
    playlist = ref.watch(featuredPlaylistController);
    player = ref.watch(audioPlayerService);

    return ListView.separated(
      separatorBuilder: (_, __) => kMediumHeight,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: playlist?.featurePlaylistList?.songs?.length ?? 0,
      itemBuilder: (_, i) {
        return _buildSongTile(playlist?.featurePlaylistList?.songs?[i]);
      },
    );
  }

  Widget _buildSongTile(Song? song) {
    return ListTile(
      onTap: () async {
        player?.play(song!.downloadUrl![0].link!);
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(kSmallRadius),
        child: SizedBox.square(
            dimension: 40, child: PreviewImage(url: song?.image?[0].link)),
      ),
      title: Text(
        '${song?.name}'.replaceAll("&quot;", "''"),
        style: textTheme.bodyText1,
      ),
      subtitle: PaddedRow(
        padding: const EdgeInsets.only(right: 24.0),
        children: [
          song?.explicitContent == 1 ? const Text('Explicit') : const Text(''),
          Expanded(
            child: Text(
              '${song?.artist}',
              style: textTheme.caption,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.more_horiz),
        onPressed: () {
          print('Swipe up More actions');
        },
      ),
    );
  }
}
