import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  const Data._();
  const factory Data({
    int? companyId,
    int? mid,
    int? loginId,
    int? companyBasicId,
    int? accountTypeId,
    String? accountTypeName,
    String? uploadImage,
    bool? isEnableProductUpload,
    String? contactType,
    String? company,
    String? loginName,
    String? name,
    String? password,
    String? emailId,
    String? mobile,
    String? identityType,
    String? identityNumber,
    String? uploadIdentity,
    String? professionalSkills,
    String? storeName,
    String? stores,
    int? subscriptionId,
    bool? isPrimaryAddress,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
    String? contactCompany,
    int? result,
    String? insertedDate,
    bool? isDefaultBranchLocation,
  }) = _Data;
}

@freezed
class DataDto with _$DataDto {
  const DataDto._();
  const factory DataDto({
    int? companyId,
    int? mid,
    int? loginId,
    int? companyBasicId,
    int? accountTypeId,
    String? accountTypeName,
    String? uploadImage,
    bool? isEnableProductUpload,
    String? contactType,
    String? company,
    String? loginName,
    String? name,
    String? password,
    String? emailId,
    String? mobile,
    String? identityType,
    String? identityNumber,
    String? uploadIdentity,
    String? professionalSkills,
    String? storeName,
    String? stores,
    int? subscriptionId,
    bool? isPrimaryAddress,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
    String? contactCompany,
    int? result,
    String? insertedDate,
    bool? isDefaultBranchLocation,
  }) = _DataDto;
  factory DataDto.fromJson(Map<String, dynamic> json) =>
      _$DataDtoFromJson(json);
  factory DataDto.fromDomain(Data _) {
    return DataDto(
        companyId: _.companyId,
        mid: _.mid,
        loginId: _.loginId,
        companyBasicId: _.companyBasicId,
        accountTypeId: _.accountTypeId,
        accountTypeName: _.accountTypeName,
        uploadImage: _.uploadImage,
        isEnableProductUpload: _.isEnableProductUpload,
        contactType: _.contactType,
        company: _.company,
        loginName: _.loginName,
        name: _.name,
        password: _.password,
        emailId: _.emailId,
        mobile: _.mobile,
        identityType: _.identityType,
        identityNumber: _.identityNumber,
        uploadIdentity: _.uploadIdentity,
        professionalSkills: _.professionalSkills,
        storeName: _.storeName,
        stores: _.stores,
        subscriptionId: _.subscriptionId,
        isPrimaryAddress: _.isPrimaryAddress,
        address: _.address,
        city: _.city,
        state: _.state,
        zipCode: _.zipCode,
        country: _.country,
        contactCompany: _.contactCompany,
        result: _.result,
        insertedDate: _.insertedDate,
        isDefaultBranchLocation: _.isDefaultBranchLocation);
  }
  Data toDomain() {
    return Data(
        companyId: companyId,
        mid: mid,
        loginId: loginId,
        companyBasicId: companyBasicId,
        accountTypeId: accountTypeId,
        accountTypeName: accountTypeName,
        uploadImage: uploadImage,
        isEnableProductUpload: isEnableProductUpload,
        contactType: contactType,
        company: company,
        loginName: loginName,
        name: name,
        password: password,
        emailId: emailId,
        mobile: mobile,
        identityType: identityType,
        identityNumber: identityNumber,
        uploadIdentity: uploadIdentity,
        professionalSkills: professionalSkills,
        storeName: storeName,
        stores: stores,
        subscriptionId: subscriptionId,
        isPrimaryAddress: isPrimaryAddress,
        address: address,
        city: city,
        state: state,
        zipCode: zipCode,
        country: country,
        contactCompany: contactCompany,
        result: result,
        insertedDate: insertedDate,
        isDefaultBranchLocation: isDefaultBranchLocation);
  }
}

@freezed
class RemoteResponse<T> with _$RemoteResponse<T> {
  const RemoteResponse._();
  const factory RemoteResponse.noConnection() = _NoConnection<T>;
  const factory RemoteResponse.withNewData(T data) = _WithNewData<T>;
}
