import 'package:buffer/core/networking/dio_client.dart';
import 'package:buffer/features/featured_album/model/featured_album_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final featuredAlbumController = ChangeNotifierProvider((ref) {
  return FeaturedAlbumController();
});

class FeaturedAlbumController extends ChangeNotifier {
  final api = ApiClient();

  Results? albumList;

  set setFeaturedAlbumList(dynamic value) {
    albumList = FeatureAlbumList.fromJson(value).results;
    notifyListeners();
  }

  bool? isLoading = false;

  set setIsLoading(bool? value) {
    isLoading = value;
    notifyListeners();
  }

  /// Get pallet of playlist background from [ImageProvider]
  NetworkImage? image;

  set setPalletImage(String value) {
    image = NetworkImage(value);
    notifyListeners();
  }

  Future load(String albumId) async {
    setIsLoading = true;

    var response = await api.get('/albums', queryParameters: {'id': albumId});

    setFeaturedAlbumList = response;
    setPalletImage = albumList!.image![2].link!;
    setIsLoading = false;
  }
}
