import 'package:buffer/constants/dimensions.dart';
import 'package:buffer/core/theming/theming_globals.dart';
import 'package:buffer/features/home/pages/widgets/new_releases_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/home_page_controller.dart';
import 'widgets/top_charts_view.dart';

class HomePageView extends ConsumerWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var homeProvider = ref.watch(homePageController);

    var greeting = homeProvider.homeData?.results?.greeting;

    if (homeProvider.isLoading == true) {
      return const Material(child: CupertinoActivityIndicator());
    }

    return Scaffold(
      extendBody: true,
      body: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: kToolbarHeight),
          Padding(
            padding: kHorizontalPadding,
            child: Text(
              '$greeting',
              style: textTheme.headline4,
            ),
          ),
          kMediumHeight,
          const TopChartsSection(),
          kLargeHeight,
          const NewReleasesView()
        ],
      ),
    );
  }
}
