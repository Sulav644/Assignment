import 'package:flutter_bloc/flutter_bloc.dart';

import '../../all_contacts/data/add_data.dart';
import 'add_data_const.dart';

class AddDataCubit extends Cubit<AddData> {
  AddDataCubit() : super(addData);
  void setLoginName(String loginName) {
    emit(state.copyWith(loginName: loginName));
  }

  void setName(String name) {
    emit(state.copyWith(name: name));
  }

  void setPassword(String password) {
    emit(state.copyWith(password: password));
  }

  void setEmailId(String emailId) {
    emit(state.copyWith(emailId: emailId));
  }

  void setAccountTypeId(int accountTypeId) {
    emit(state.copyWith(accountTypeId: accountTypeId));
  }

  void setMobile(String mobile) {
    emit(state.copyWith(mobile: mobile));
  }

  void setStores(List<Map<String, dynamic>> dataList) {
    emit(state.copyWith(stores: dataList));
  }

  void setContactType(String contactType) {
    emit(state.copyWith(contactType: contactType));
  }

  void setEnabledProduct(bool status) {
    emit(state.copyWith(isEnableProductUpload: status));
  }

  void setDefaultBranch(bool status) {
    emit(state.copyWith(isDefaultBranchLocation: status));
  }

  void setPrimaryAddress(bool status) {
    emit(state.copyWith(isPrimaryAddress: status));
  }

  void setCountry(String country) {
    emit(state.copyWith(country: country));
  }

  void setAddress(String address) {
    emit(state.copyWith(address: address));
  }

  void setState(String stateName) {
    emit(state.copyWith(state: stateName));
  }

  void setZipCode(String zipCode) {
    emit(state.copyWith(zipCode: zipCode));
  }

  void setContactCompany(String contactCompany) {
    emit(state.copyWith(contactCompany: contactCompany));
  }

  void setCity(String city) {
    emit(state.copyWith(city: city));
  }

  void setAddData(
      String loginName,
      String name,
      String password,
      String email,
      String mobile,
      String country,
      String contactCompany,
      String stateName,
      String zipCode,
      String city,
      String storeNames,
      String contactType,
      bool enableProduct,
      bool defaultBranch,
      bool primaryAddress) {
    emit(state.copyWith(
        loginName: loginName,
        name: name,
        password: password,
        emailId: email,
        mobile: mobile,
        country: country,
        contactCompany: contactCompany,
        state: stateName,
        zipCode: zipCode,
        city: city,
        stores: storeNames.split(',').map((e) => {"Text": e}).toList(),
        contactType: contactType,
        isEnableProductUpload: enableProduct,
        isDefaultBranchLocation: defaultBranch,
        isPrimaryAddress: primaryAddress));
  }
}
