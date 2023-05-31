import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_failure.freezed.dart';

@freezed
class DataFailure with _$DataFailure {
  const DataFailure._();
  const factory DataFailure.api(int? errorCode) = _Api;
}
