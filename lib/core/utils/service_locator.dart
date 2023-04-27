import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/home_repo_impl.dart';
import '../models/config_model.dart';
import './api_services.dart';

final GetIt _getIt = GetIt.instance;

class ServiveLocator {
  static Future<void> setUp() async {
    // read json file from asset folder by using rootBundle
    final configFile = await rootBundle.loadString('assets/config/main.json');

    // convert json to key value pairs to facilitate dealing with it
    final configData = jsonDecode(configFile);

    // just to save ConfigModel as singleton
    _getIt.registerSingleton<ConfigModel>(
      ConfigModel(
        apiKey: configData['API_KEY'],
        baseApiUrl: configData['BASE_API_URL'],
        baseImageUrl: configData['BASE_IMAGE_URL'],
      ),
    );
    // save instance from apiServices and homeRepoImpl
    _getIt.registerSingleton<ApiServices>(ApiServices());
    _getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl());
  }
}
