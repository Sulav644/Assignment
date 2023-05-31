import 'data_notifier.dart';
import 'data_repository.dart';

class DataResponseNotifier extends PagedDataNotifier {
  final DataRepository _repository;
  DataResponseNotifier(this._repository);
  Future<void> getDataResponse() async {
    super.getPage(() => _repository.getData());
  }
}

class SingleDataResponseNotifier extends SinglePagedDataNotifier {
  final DataRepository _repository;
  SingleDataResponseNotifier(this._repository);
  Future<void> getDataResponse(
      {required int companyBasicId, required int loginId}) async {
    super.getPage(() => _repository.getSingleData(
        companyBasicId: companyBasicId, loginId: loginId));
  }
}
