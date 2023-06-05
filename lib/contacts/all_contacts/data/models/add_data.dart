import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_data.freezed.dart';
part 'add_data.g.dart';

@freezed
class AddData with _$AddData {
  const AddData._();
  const factory AddData({
    @Default(true) bool isDefaultBranchLocation,
    @Default('DEF56C4F-808D-4F81-993C-EF67C77A5F91') String companyId,
    required int accountTypeId,
    @Default(false) bool isEnableProductUpload,
    @Default('Customer') String contactType,
    @Default('JBS991') String company,
    required String loginName,
    required String name,
    required String password,
    required String emailId,
    required String mobile,
    @Default('Pancard') String identityType,
    @Default('99KSHSK0991') String identityNumber,
    @Default('Pan//Image path991') String uploadIdentity,
    @Default('tech991') String professionalSkills,
    @Default(1) int subscriptionId,
    required List<Map<String, dynamic>> stores,
    @Default(false) bool isPrimaryAddress,
    @Default('lat: 37.42 long: 122.08') String address,
    required String city,
    required String state,
    required String zipCode,
    required String country,
    required String contactCompany,
    @Default('JBS991') String mid,
  }) = _AddData;
  factory AddData.fromJson(Map<String, dynamic> json) =>
      _$AddDataFromJson(json);
}

@freezed
class StoreData with _$StoreData {
  const StoreData._();
  const factory StoreData({
    required String text,
  }) = _StoreData;
  factory StoreData.fromJson(Map<String, dynamic> json) =>
      _$StoreDataFromJson(json);
}

@freezed
class StoreTempData with _$StoreTempData {
  const StoreTempData._();
  const factory StoreTempData({
    required int index,
    required String text,
  }) = _StoreTempData;
  factory StoreTempData.fromJson(Map<String, dynamic> json) =>
      _$StoreTempDataFromJson(json);
}

@freezed
class StoreTempDataList with _$StoreTempDataList {
  const StoreTempDataList._();
  const factory StoreTempDataList({
    required List<StoreTempData> data,
  }) = _StoreTempDataList;
}
