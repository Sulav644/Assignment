import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_details.freezed.dart';

@freezed
class LocationDetails with _$LocationDetails {
  const LocationDetails._();
  const factory LocationDetails({
    String? lat,
    String? long,
    String? address,
    String? area,
    String? landmark,
    String? city,
    String? zipCode,
    String? country,
  }) = _LocationDetails;
}
