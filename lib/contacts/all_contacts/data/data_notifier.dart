import 'dart:io';
import 'package:xoomship/contacts/all_contacts/data/remote_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'models/data.dart';
import 'payloads.dart';
import 'extension.dart';

part 'data_notifier.freezed.dart';

class RestApiException implements Exception {
  final int? errorCode;
  RestApiException(this.errorCode);
}

extension DTOToDomain on DataDto {
  Data toSingleDomain() {
    return toDomain();
  }
}

extension DioErrorX on DioError {
  bool get isNoConnectionError {
    return type == DioErrorType.unknown && error is SocketException;
  }
}

typedef DataGetter = Future<List<Data>> Function();
typedef SingleDataGetter = Future<Data> Function();

@freezed
class PagedDataState with _$PagedDataState {
  const PagedDataState._();
  const factory PagedDataState.initial(List<Data> data) = _Initial;
  const factory PagedDataState.loadInProgress(List<Data> data) =
      _LoadInProgress;
  const factory PagedDataState.loadSuccess(List<Data> data) = _LoadSuccess;
  const factory PagedDataState.loadFailure(List<Data> data) = _LoadFailure;
}

@freezed
class SinglePagedDataState with _$SinglePagedDataState {
  const SinglePagedDataState._();
  const factory SinglePagedDataState.initial(Data data) = _SingleInitial;
  const factory SinglePagedDataState.loadInProgress(Data data) =
      _SingleLoadInProgress;
  const factory SinglePagedDataState.loadSuccess(Data data) =
      _SingleLoadSuccess;
  const factory SinglePagedDataState.loadFailure(Data data) =
      _SingleLoadFailure;
}

class PagedDataNotifier extends Cubit<PagedDataState> {
  PagedDataNotifier() : super(const PagedDataState.initial([Data()]));
  Future getPage(
      {required List<dynamic> Function(dynamic json) jsonDataSelector}) async {
    emit(PagedDataState.loadInProgress(state.data));

    final response = await RemoteService(Dio()..interceptors).getData(
      requestUri: Uri.https(baseUrl, '$path/GetContactProfiles'),
      data: {"CompanyId": "DEF56C4F-808D-4F81-993C-EF67C77A5F91"},
    );
    try {
      if (response.statusCode == 200) {
        final convertedData = jsonDataSelector(response.data)
            .map((e) => DataDto.fromJson(e))
            .toList();

        emit(PagedDataState.loadSuccess([...convertedData.toDomain()]));
      } else {
        emit(const PagedDataState.loadFailure([]));
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return const SocketException('');
      } else if (e.response != null) {
        throw const PagedDataState.loadFailure([]);
      } else {
        rethrow;
      }
    }
  }
}

class SinglePagedDataNotifier extends Cubit<SinglePagedDataState> {
  SinglePagedDataNotifier() : super(SinglePagedDataState.initial(data));
  getPage({required int companyBasicId, required int loginId}) async {
    emit(SinglePagedDataState.loadInProgress(state.data));

    final response = await RemoteService(Dio()..interceptors).getSingleData(
        requestUri: Uri.https(baseUrl, '$path/GetContactProfilesById'),
        data: {
          "CompanyId": "DEF56C4F-808D-4F81-993C-EF67C77A5F91",
          "companyBasicId": companyBasicId,
          "loginId": loginId
        });
    try {
      if (response.statusCode == 200) {
        final convertedData = DataDto.fromJson(response.data);

        emit(SinglePagedDataState.loadSuccess(convertedData.toSingleDomain()));
      } else {
        emit(SinglePagedDataState.loadFailure(state.data));
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return const SocketException('');
      } else if (e.response != null) {
        throw SinglePagedDataState.loadFailure(state.data);
      } else {
        rethrow;
      }
    }
  }

  Future<Map<String, dynamic>> addData({
    required Map<String, dynamic> data,
  }) async {
    emit(SinglePagedDataState.loadInProgress(state.data));
    try {
      final response = await RemoteService(Dio()..interceptors).addData(
          requestUri: Uri.https(baseUrl, '$path/AddContactRegistration'),
          data: data);
      if (response.statusCode == 200) {
        emit(const SinglePagedDataState.loadSuccess(Data()));
        return {"statusCode": response.statusCode, "body": response.data};
      } else {
        emit(const SinglePagedDataState.loadFailure(Data()));
        return {"statusCode": response.statusCode, "body": response.data};
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        emit(const SinglePagedDataState.loadFailure(Data()));
        return {"statusCode": e.response?.statusCode, "body": e.response?.data};
      } else if (e.response != null) {
        emit(const SinglePagedDataState.loadFailure(Data()));
        return {"statusCode": e.response?.statusCode, "body": e.response?.data};
      } else {
        rethrow;
      }
    }
  }

  Future<int> deleteData(
      {required int companyBasicId, required int loginId}) async {
    try {
      final response = await RemoteService(Dio()..interceptors).deleteData(
          requestUri: Uri.https(baseUrl, '$path/DeleteContactRegistration'),
          data: {"companyBasicId": companyBasicId, "loginId": loginId});
      if (response.statusCode == 200) {
        final convertedData = response.statusCode!;
        return convertedData;
      } else {
        throw const SocketException('');
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return e.response!.statusCode!;
      } else if (e.response != null) {
        throw const SocketException('');
      } else {
        rethrow;
      }
    }
  }
}
