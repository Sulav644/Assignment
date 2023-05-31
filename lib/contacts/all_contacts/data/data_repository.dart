import 'package:assignment_app/assignment/contacts/all_contacts/data/payloads.dart';
import 'package:dartz/dartz.dart';
import 'data.dart';
import 'data_failure.dart';
import 'fresh.dart';
import 'get_remote_service.dart';
import 'network_exceptions.dart';
import 'extensions.dart';

class DataRepository {
  final GetRemoteService _remoteService;
  DataRepository(this._remoteService);
  Future<Either<DataFailure, Fresh<List<Data>>>> getData() async {
    try {
      final remotePageItems = await _remoteService.getRemoteResponse();
      return right(await remotePageItems.when(
        noConnection: () async => Fresh.no(const []),
        withNewData: (data) {
          return Fresh.yes(data.toDomain());
        },
      ));
    } on RestApiException catch (e) {
      return left(DataFailure.api(e.errorCode));
    }
  }

  Future<Either<DataFailure, Fresh<Data>>> getSingleData(
      {required int companyBasicId, required int loginId}) async {
    try {
      final remotePageItems = await _remoteService.getSingleResponse(
          companyBasicId: companyBasicId, loginId: loginId);
      return right(await remotePageItems.when(
        noConnection: () async => Fresh.no(data),
        withNewData: (data) {
          return Fresh.yes(data.toSingleDomain());
        },
      ));
    } on RestApiException catch (e) {
      return left(DataFailure.api(e.errorCode));
    }
  }

  Future<Map<String, dynamic>> postData(
      {required Map<String, dynamic> data}) async {
    return await _remoteService.postData(data: data);
  }

  Future<int> deleteData(
          {required int companyBasicId, required int loginId}) async =>
      await _remoteService.deleteAccount(
          companyBasicId: companyBasicId, loginId: loginId);
}
