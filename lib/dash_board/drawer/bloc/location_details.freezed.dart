// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocationDetails {
  String? get lat => throw _privateConstructorUsedError;
  String? get long => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get area => throw _privateConstructorUsedError;
  String? get landmark => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get zipCode => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationDetailsCopyWith<LocationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDetailsCopyWith<$Res> {
  factory $LocationDetailsCopyWith(
          LocationDetails value, $Res Function(LocationDetails) then) =
      _$LocationDetailsCopyWithImpl<$Res, LocationDetails>;
  @useResult
  $Res call(
      {String? lat,
      String? long,
      String? address,
      String? area,
      String? landmark,
      String? city,
      String? zipCode,
      String? country});
}

/// @nodoc
class _$LocationDetailsCopyWithImpl<$Res, $Val extends LocationDetails>
    implements $LocationDetailsCopyWith<$Res> {
  _$LocationDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? long = freezed,
    Object? address = freezed,
    Object? area = freezed,
    Object? landmark = freezed,
    Object? city = freezed,
    Object? zipCode = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocationDetailsCopyWith<$Res>
    implements $LocationDetailsCopyWith<$Res> {
  factory _$$_LocationDetailsCopyWith(
          _$_LocationDetails value, $Res Function(_$_LocationDetails) then) =
      __$$_LocationDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? lat,
      String? long,
      String? address,
      String? area,
      String? landmark,
      String? city,
      String? zipCode,
      String? country});
}

/// @nodoc
class __$$_LocationDetailsCopyWithImpl<$Res>
    extends _$LocationDetailsCopyWithImpl<$Res, _$_LocationDetails>
    implements _$$_LocationDetailsCopyWith<$Res> {
  __$$_LocationDetailsCopyWithImpl(
      _$_LocationDetails _value, $Res Function(_$_LocationDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? long = freezed,
    Object? address = freezed,
    Object? area = freezed,
    Object? landmark = freezed,
    Object? city = freezed,
    Object? zipCode = freezed,
    Object? country = freezed,
  }) {
    return _then(_$_LocationDetails(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LocationDetails extends _LocationDetails {
  const _$_LocationDetails(
      {this.lat,
      this.long,
      this.address,
      this.area,
      this.landmark,
      this.city,
      this.zipCode,
      this.country})
      : super._();

  @override
  final String? lat;
  @override
  final String? long;
  @override
  final String? address;
  @override
  final String? area;
  @override
  final String? landmark;
  @override
  final String? city;
  @override
  final String? zipCode;
  @override
  final String? country;

  @override
  String toString() {
    return 'LocationDetails(lat: $lat, long: $long, address: $address, area: $area, landmark: $landmark, city: $city, zipCode: $zipCode, country: $country)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationDetails &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.country, country) || other.country == country));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, lat, long, address, area, landmark, city, zipCode, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationDetailsCopyWith<_$_LocationDetails> get copyWith =>
      __$$_LocationDetailsCopyWithImpl<_$_LocationDetails>(this, _$identity);
}

abstract class _LocationDetails extends LocationDetails {
  const factory _LocationDetails(
      {final String? lat,
      final String? long,
      final String? address,
      final String? area,
      final String? landmark,
      final String? city,
      final String? zipCode,
      final String? country}) = _$_LocationDetails;
  const _LocationDetails._() : super._();

  @override
  String? get lat;
  @override
  String? get long;
  @override
  String? get address;
  @override
  String? get area;
  @override
  String? get landmark;
  @override
  String? get city;
  @override
  String? get zipCode;
  @override
  String? get country;
  @override
  @JsonKey(ignore: true)
  _$$_LocationDetailsCopyWith<_$_LocationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
