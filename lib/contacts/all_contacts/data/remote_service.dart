import 'package:assignment_app/assignment/contacts/all_contacts/data/dio_extensions.dart';
import 'package:dio/dio.dart';

import 'data.dart';
import 'network_exceptions.dart';

abstract class RemoteService {
  final Dio _dio;
  RemoteService(this._dio);
  Future<RemoteResponse<List<DataDto>>> getData(
      {required Uri requestUri,
      required Map<String, dynamic> data,
      required List<dynamic> Function(dynamic json) jsonDataSelector}) async {
    try {
      print('hello');
      final response = await _dio.postUri(requestUri, data: data);
      print('response $response');
      if (response.statusCode == 200) {
        final convertedData = jsonDataSelector(response.data)
            .map((e) => DataDto.fromJson(e))
            .toList();

        return RemoteResponse.withNewData(convertedData);
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return const RemoteResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }

  Future<RemoteResponse<DataDto>> getSingleData(
      {required Uri requestUri,
      required Map<String, dynamic> data,
      required Map<String, dynamic> Function(dynamic json)
          jsonDataSelector}) async {
    try {
      print('hello');
      final response = await _dio.postUri(requestUri, data: data);
      print('response $response');
      if (response.statusCode == 200) {
        final convertedData = DataDto.fromJson(response.data);

        return RemoteResponse.withNewData(convertedData);
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return const RemoteResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }

  Future<Map<String, dynamic>> addData({
    required Uri requestUri,
    required Map<String, dynamic> data,
  }) async {
    try {
      print('hello');
      print('jsondata $data');
      final response = await _dio.postUri(requestUri, data: data);
      print('response ${response.data}');
      if (response.statusCode == 200) {
        print(response.data);

        return {"statusCode": response.statusCode, "body": response.data};
      } else {
        print('response ${response.data}');
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return {"statusCode": e.response?.statusCode, "body": e.response?.data};
      } else if (e.response != null) {
        print(e.response?.data);
        return {"statusCode": e.response?.statusCode, "body": e.response?.data};
      } else {
        rethrow;
      }
    }
  }

  Future<int> deleteData({
    required Uri requestUri,
    required Map<String, dynamic> data,
  }) async {
    try {
      print('hello');
      final response = await _dio.postUri(requestUri, data: data);
      if (response.statusCode == 200) {
        final convertedData = response.statusCode!;
        print(response.data);
        return convertedData;
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return e.response!.statusCode!;
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
