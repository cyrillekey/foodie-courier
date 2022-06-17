import 'package:dio/dio.dart';
import 'package:foodie_courier/api_client/api_response.dart';

class ApiClient {
  final String baseUrl;
  late Dio dio;
  ApiClient(this.baseUrl, Dio? dio) {
    this.dio = dio ?? Dio();
    this.dio
      ..httpClientAdapter
      ..options.headers = {
        Headers.contentTypeHeader: Headers.jsonContentType,
        'Accept-Encoding': '*'
      };
  }
  Future<ApiResponse> post(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      ProgressCallback? progressCallback}) async {
    try {
      var response = await dio.post(uri,
          data: data,
          queryParameters: queryParameters,
          onReceiveProgress: progressCallback,
          options: options);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse(true, response.statusMessage,
            response: response.data);
      } else {
        return ApiResponse(false, response.statusMessage,
            response: response.data);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> get(String uri,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      ProgressCallback? progressCallback}) async {
    try {
      var response = await dio.get(uri,
          queryParameters: queryParameters,
          onReceiveProgress: progressCallback,
          options: options);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse(true, response.statusMessage,
            response: response.data);
      } else {
        return ApiResponse(false, response.statusMessage,
            response: response.data);
      }
    } catch (e) {
      rethrow;
    }
  }
}
