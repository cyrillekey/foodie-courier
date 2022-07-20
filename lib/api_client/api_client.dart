import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foodie_courier/api_client/api_response.dart';
import 'package:foodie_courier/services/service_locator.dart';

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
      var response = await dio.post(baseUrl + uri,
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
    } on DioError catch (e) {
      String message = e.response?.data['message'];
      return ApiResponse(false, message);
    } catch (e) {
      return ApiResponse(false, "Something Went Wrong");
    }
  }

  Future<ApiResponse> get(String uri,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      ProgressCallback? progressCallback}) async {
    try {
      var response = await dio.get(baseUrl + uri,
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
    } on DioError catch (e) {
      String message = e.response?.data['message'];
      return ApiResponse(false, message, response: e.response?.data);
    } catch (e) {
      return ApiResponse(false, "Something Went Wrong Please Try Again");
    }
  }
}
