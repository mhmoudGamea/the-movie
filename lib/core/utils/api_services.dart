import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:the_movie/core/models/config_model.dart';

class ApiServices {
  static late Dio _dio;

  static final getIt = GetIt.instance;

  static void initializeDio() {
    ConfigModel config = getIt.get<ConfigModel>();
    _dio = Dio(
      BaseOptions(
        baseUrl: config.getBaseApiUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<Map<String, dynamic>> get(String endPoint,
      {Map<String, dynamic>? query}) async {
    ConfigModel config = getIt.get<ConfigModel>();

    // api_key=${config.getApiKey}
    Map<String, dynamic> query0 = {
      'api_key': config.getApiKey,
      'language': 'en-US',
    };

    if (query != null) {
      query0.addAll(query);
    }

    try {
      final response = await _dio.get(endPoint, queryParameters: query0);
      // print(response.data['results'][0]);
      return response.data;
    } on DioError catch (error) {
      // the next line 'll returned if i send an invalid endPoint to this get method
      //{"success":false,"status_code":34,"status_message":"The resource you requested could not be found."}
      return error.response!.data;
    }
  }
}
