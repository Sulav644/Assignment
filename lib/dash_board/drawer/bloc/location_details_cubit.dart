import 'package:flutter_bloc/flutter_bloc.dart';

import 'location_details.dart';

class LocationDetailsCubit extends Cubit<LocationDetails> {
  LocationDetailsCubit() : super(LocationDetails());
  void setLatLong({required String lat, required String long}) {
    emit(state.copyWith(lat: lat, long: long));
    print(state);
  }

  void setAddress({required String address}) {
    emit(state.copyWith(address: address));
    print(state);
  }

  void setArea({required String area}) {
    emit(state.copyWith(area: area));
    print(state);
  }

  void setLandmark({required String landmark}) {
    emit(state.copyWith(landmark: landmark));
    print(state);
  }

  void setCity({required String city}) {
    emit(state.copyWith(city: city));
    print(state);
  }

  void setZipCode({required String zipCode}) {
    emit(state.copyWith(zipCode: zipCode));
    print(state);
  }

  void setCountry({required String country}) {
    emit(state.copyWith(country: country));
    print(state);
  }

  void setDetails(
      {required String address,
      required String area,
      required String landmark,
      required String city,
      required String zipCode,
      required String country}) {
    emit(state.copyWith(
        address: address,
        area: area,
        landmark: landmark,
        city: city,
        zipCode: zipCode,
        country: country));
    print('state $state');
  }
}
