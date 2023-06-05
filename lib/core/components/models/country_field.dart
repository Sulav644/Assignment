import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_field.freezed.dart';

@freezed
class CountryField with _$CountryField {
  const CountryField._();
  const factory CountryField({
    required String flag,
    required String countryName,
  }) = _CountryField;
}
