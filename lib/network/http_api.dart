import 'package:dio/dio.dart';

class HttpApi {
  static HttpApi? _instance;
  Dio? _dio;

  static header() => {"accept": "application/json", "Content-Type": "application/json", "Accept-Encoding": "gzip"};

  static Future<HttpApi> createInstance() async {
    if (_instance == null) {
      _instance = HttpApi();
      await _instance?.init();
    }
    return _instance!;
  }

  Future<HttpApi> init() async {
    _dio = Dio(BaseOptions(baseUrl: 'https://apis.data.go.kr/', headers: header(), connectTimeout: const Duration(seconds: 50), receiveTimeout: const Duration(seconds: 30)));
    _dio!.interceptors.add(
        LogInterceptor(responseBody: false)
    );
    return this;
  }
}