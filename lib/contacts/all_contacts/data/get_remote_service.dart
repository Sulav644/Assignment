import 'package:assignment_app/assignment/contacts/all_contacts/data/payloads.dart';
import 'package:dio/dio.dart';

import 'add_data.dart';
import 'data.dart';
import 'remote_service.dart';

class GetRemoteService extends RemoteService {
  GetRemoteService(
    Dio dio,
  ) : super(dio);
  Future<RemoteResponse<List<DataDto>>> getRemoteResponse() async {
    return super.getData(
      requestUri: Uri.https(baseUrl, '$path/GetContactProfiles'),
      data: {"CompanyId": "DEF56C4F-808D-4F81-993C-EF67C77A5F91"},
      jsonDataSelector: (json) => json as List<dynamic>,
    );
  }

  Future<RemoteResponse<DataDto>> getSingleResponse(
      {required int companyBasicId, required int loginId}) async {
    return super.getSingleData(
      requestUri: Uri.https(baseUrl, '$path/GetContactProfilesById'),
      data: {
        "CompanyId": "DEF56C4F-808D-4F81-993C-EF67C77A5F91",
        "companyBasicId": companyBasicId,
        "loginId": loginId
      },
      jsonDataSelector: (json) => json as Map<String, dynamic>,
    );
  }

  Future<Map<String, dynamic>> postData(
      {required Map<String, dynamic> data}) async {
    return super.addData(
      requestUri: Uri.https(baseUrl, '$path/AddContactRegistration'),
      data: data,
    );
  }

  Future<int> deleteAccount(
      {required int companyBasicId, required int loginId}) async {
    return super.deleteData(
      requestUri: Uri.https(baseUrl, '$path/DeleteContactRegistration'),
      data: {"companyBasicId": companyBasicId, "loginId": loginId},
    );
  }
}
