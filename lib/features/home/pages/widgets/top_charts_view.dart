import 'package:buffer/core/theming/theming_globals.dart';
import 'package:buffer/core/view_navigator/view_navigation.dart';
import 'package:buffer/features/featured_playlist/pages/featured_playlist_view.dart';
import 'package:buffer/features/home/providers/home_page_controller.dart';
import 'package:buffer/widgets/load_image_widget.dart';
import 'package:buffer/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/home_page_response.dart';

class TopChartsSection extends ConsumerWidget {
  const TopChartsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var homeProvider = ref.watch(homePageController);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: kHorizontalPadding,
          child: Text(
            'Top Charts',
            style: textTheme.headline6,
          ),
        ),
        kMediumHeight,
        SizedBox(
          height: 150,
          child: ListView.separated(
              separatorBuilder: (_, __) => kMediumWidth,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: homeProvider.homeData?.results?.charts?.length ?? 0,
              itemBuilder: (context, index) {
                return _buildCard(
                    homeProvider.homeData?.results?.charts?[index]);
              }),
        ),
      ],
    );
  }

  Widget _buildCard(Chart? item) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(FeaturePlaylistView(
          playlistId: item?.id,
        ));
      },
      child: Column(
        children: [
          Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(kRadius),
                  child: PreviewImage(url: item?.image))),
          kSmallHeight,
          Text('${item?.title}'),
        ],
      ),
    );
  }
}
