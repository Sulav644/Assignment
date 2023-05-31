import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCountryCubit extends Cubit<String> {
  SelectCountryCubit() : super('Country');
  void selectCountry(String country) => emit(country);
}
