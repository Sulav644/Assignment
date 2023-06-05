import 'package:dio/dio.dart';

class RemoteService {
  final Dio _dio;
  RemoteService(this._dio);
  Future<Response> getData({
    required Uri requestUri,
    required Map<String, dynamic> data,
  }) async {
    final response = await _dio.postUri(requestUri, data: data);
    return response;
  }

  Future<Response> getSingleData({
    required Uri requestUri,
    required Map<String, dynamic> data,
  }) async {
    final response = await _dio.postUri(requestUri, data: data);
    return response;
  }

  Future<Response> addData({
    required Uri requestUri,
    required Map<String, dynamic> data,
  }) async {
    final response = await _dio.postUri(requestUri, data: data);
    return response;
  }

  Future<Response> deleteData({
    required Uri requestUri,
    required Map<String, dynamic> data,
  }) async {
    final response = await _dio.postUri(requestUri, data: data);
    return response;
  }
}
