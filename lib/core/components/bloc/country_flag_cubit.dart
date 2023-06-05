import 'package:country_picker/country_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/country_field.dart';

class CountryFlagCubit extends Cubit<List<CountryField>> {
  CountryFlagCubit()
      : super([
          CountryField(flag: 'IN', countryName: 'India'),
          CountryField(flag: 'US', countryName: 'United States')
        ]);
  void setFlage(
      {required int index, required String flag, required String countryName}) {
    List<CountryField> list = [];
    print('$index $flag');
    for (var element in state) {
      if (state.indexOf(element) != index) {
        list.add(element);
      }
    }
    list.insert(index, CountryField(flag: flag, countryName: countryName));
    emit([...list]);
    print(state);
  }
}
