// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddData _$$_AddDataFromJson(Map<String, dynamic> json) => _$_AddData(
      isDefaultBranchLocation: json['isDefaultBranchLocation'] as bool? ?? true,
      companyId: json['companyId'] as String? ??
          'DEF56C4F-808D-4F81-993C-EF67C77A5F91',
      accountTypeId: json['accountTypeId'] as int,
      isEnableProductUpload: json['isEnableProductUpload'] as bool? ?? false,
      contactType: json['contactType'] as String? ?? 'Customer',
      company: json['company'] as String? ?? 'JBS991',
      loginName: json['loginName'] as String,
      name: json['name'] as String,
      password: json['password'] as String,
      emailId: json['emailId'] as String,
      mobile: json['mobile'] as String,
      identityType: json['identityType'] as String? ?? 'Pancard',
      identityNumber: json['identityNumber'] as String? ?? '99KSHSK0991',
      uploadIdentity: json['uploadIdentity'] as String? ?? 'Pan//Image path991',
      professionalSkills: json['professionalSkills'] as String? ?? 'tech991',
      subscriptionId: json['subscriptionId'] as int? ?? 1,
      stores: (json['stores'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      isPrimaryAddress: json['isPrimaryAddress'] as bool? ?? false,
      address: json['address'] as String? ?? 'lat: 37.42 long: 122.08',
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zipCode'] as String,
      country: json['country'] as String,
      contactCompany: json['contactCompany'] as String,
      mid: json['mid'] as String? ?? 'JBS991',
    );

Map<String, dynamic> _$$_AddDataToJson(_$_AddData instance) =>
    <String, dynamic>{
      'isDefaultBranchLocation': instance.isDefaultBranchLocation,
      'companyId': instance.companyId,
      'accountTypeId': instance.accountTypeId,
      'isEnableProductUpload': instance.isEnableProductUpload,
      'contactType': instance.contactType,
      'company': instance.company,
      'loginName': instance.loginName,
      'name': instance.name,
      'password': instance.password,
      'emailId': instance.emailId,
      'mobile': instance.mobile,
      'identityType': instance.identityType,
      'identityNumber': instance.identityNumber,
      'uploadIdentity': instance.uploadIdentity,
      'professionalSkills': instance.professionalSkills,
      'subscriptionId': instance.subscriptionId,
      'stores': instance.stores,
      'isPrimaryAddress': instance.isPrimaryAddress,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'country': instance.country,
      'contactCompany': instance.contactCompany,
      'mid': instance.mid,
    };

_$_StoreData _$$_StoreDataFromJson(Map<String, dynamic> json) => _$_StoreData(
      text: json['text'] as String,
    );

Map<String, dynamic> _$$_StoreDataToJson(_$_StoreData instance) =>
    <String, dynamic>{
      'text': instance.text,
    };

_$_StoreTempData _$$_StoreTempDataFromJson(Map<String, dynamic> json) =>
    _$_StoreTempData(
      index: json['index'] as int,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$_StoreTempDataToJson(_$_StoreTempData instance) =>
    <String, dynamic>{
      'index': instance.index,
      'text': instance.text,
    };
