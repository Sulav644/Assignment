import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomship/contacts/add_contact_form/components/location_fields.dart';

import '../../../dash_board/drawer/bloc/location_details.dart';

class AddMultipleAddressCubit extends Cubit<List<LocationDetails>> {
  AddMultipleAddressCubit() : super([]);
  void addAddress(
      {required String address,
      required String area,
      required String stateName,
      required String landmark,
      required String city,
      required String zipCode,
      required String country}) {
    List<LocationDetails> list = state;
    list.add(LocationDetails(
        address: address,
        area: area,
        state: stateName,
        landmark: landmark,
        city: city,
        zipCode: zipCode,
        country: country));
    emit([...list]);
    print(state);
  }
}
