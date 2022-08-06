import 'package:buffer/core/networking/dio_client.dart';
import 'package:buffer/features/home/models/home_page_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homePageController = ChangeNotifierProvider((ref) {
  var state = HomePageController();
  state.getHomePage();

  return state;
});

class HomePageController extends ChangeNotifier {
  final api = ApiClient();

  HomeData? homeData;

  bool isLoading = false;

  set setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  set setHomeData(dynamic data) {
    homeData = HomeData.fromJson(data);
    notifyListeners();
  }

  Future getHomePage() async {
    setIsLoading = true;
    var response = await api.get('/home');
    setHomeData = response;
    setIsLoading = false;
  }
}
