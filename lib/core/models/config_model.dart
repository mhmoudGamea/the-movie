class ConfigModel {
  final String apiKey;
  final String baseApiUrl;
  final String baseImageUrl;

  ConfigModel({
    required this.apiKey,
    required this.baseApiUrl,
    required this.baseImageUrl,
  });

  String get getApiKey {
    return apiKey;
  }

  String get getBaseApiUrl {
    return baseApiUrl;
  }

  String get getBaseImageUrl {
    return baseImageUrl;
  }

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(
      apiKey: json['API_KEY'],
      baseApiUrl: json['BASE_API_URL'],
      baseImageUrl: json['BASE_IMAGE_URL'],
    );
  }
}
