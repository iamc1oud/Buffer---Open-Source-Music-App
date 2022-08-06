import 'package:buffer/constants/dimensions.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';

class PlaylistActions extends StatelessWidget {
  const PlaylistActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SeparatedRow(
      padding: kHorizontalPadding,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      separatorBuilder: () => kSmallWidth,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
        const Spacer(),
        FloatingActionButton.extended(
            onPressed: () {}, label: const Icon(Icons.play_arrow_rounded))
      ],
    );
  }
}
