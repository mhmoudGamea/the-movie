import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:the_movie/core/constants.dart';
import 'package:the_movie/core/models/config_model.dart';
import 'package:shimmer/shimmer.dart';

class Helper {
  static final _getConfig = GetIt.instance.get<ConfigModel>();

  // this func: access to ServiceLocator file then get baseUrl of image and merge it with the image endPoint
  static String getImagePath(String? endPoint) {
    return '${_getConfig.getBaseImageUrl}$endPoint';
  }

  static Widget getShimmer({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: firstColor,
      highlightColor: thirdColor,
      child: Container(
        width: width,
        height: height,
        // shimmer want decoration to work i don't know why?
        decoration: BoxDecoration(
          border: Border.all(color: firstColor, width: 1),
          color: firstColor,
        ),
      ),
    );
  }

  // here the date could be null or empty if any of this 'll return 'N/A'
  static String getDate(String? date) {
    if (date == null || date.isEmpty) {
      return 'N/A';
    }
    return DateFormat.yMMMd().format(DateTime.parse(date));
  }
}
