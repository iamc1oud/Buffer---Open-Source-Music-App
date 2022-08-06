import 'package:buffer/constants/dimensions.dart';
import 'package:buffer/core/audio_player/audio_player_service.dart';
import 'package:buffer/core/theming/theming_globals.dart';
import 'package:buffer/features/featured_album/model/featured_album_list.dart';
import 'package:buffer/features/featured_album/providers/feature_album_controller.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlbumSongsView extends ConsumerStatefulWidget {
  const AlbumSongsView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AlbumSongsViewState();
}

class _AlbumSongsViewState extends ConsumerState<AlbumSongsView> {
  FeaturedAlbumController? playlist;
  AudioPlayerService? player;

  @override
  Widget build(BuildContext context) {
    playlist = ref.watch(featuredAlbumController);
    player = ref.watch(audioPlayerService);

    return ListView.separated(
      separatorBuilder: (_, __) => kMediumHeight,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: playlist?.albumList?.songs?.length ?? 0,
      itemBuilder: (_, i) {
        return _buildSongTile(playlist?.albumList?.songs?[i]);
      },
    );
  }

  Widget _buildSongTile(Song? song) {
    return ListTile(
      onTap: () async {
        player?.play(song!.downloadUrl![0].link!);
      },
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
