import 'package:buffer/core/networking/dio_client.dart';
import 'package:buffer/features/featured_playlist/models/feature_playlist_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final featuredPlaylistController = ChangeNotifierProvider.autoDispose((ref) {
  var state = FeaturePlaylistController();

  return state;
});

class FeaturePlaylistController extends ChangeNotifier {
  final api = ApiClient();

  bool? isLoading = false;

  set setIsLoading(bool? value) {
    isLoading = value;
    notifyListeners();
  }

  Results? featurePlaylistList;

  set setFeaturePlaylistList(dynamic value) {
    featurePlaylistList = FeaturePlaylistList.fromJson(value).results;
    notifyListeners();
  }

  /// Get pallet of playlist background from [ImageProvider]
  NetworkImage? image;

  set setPalletImage(String value) {
    image = NetworkImage(value);
    notifyListeners();
  }

  Future<void> load({String? playlistId}) async {
    setIsLoading = true;
    final response =
        await api.get('/playlists', queryParameters: {"id": playlistId});

    setFeaturePlaylistList = response;
    setPalletImage = featurePlaylistList!.image![0].link!;
    setIsLoading = false;
  }
}
