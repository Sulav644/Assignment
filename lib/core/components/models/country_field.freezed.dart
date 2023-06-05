// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CountryField {
  String get flag => throw _privateConstructorUsedError;
  String get countryName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountryFieldCopyWith<CountryField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryFieldCopyWith<$Res> {
  factory $CountryFieldCopyWith(
          CountryField value, $Res Function(CountryField) then) =
      _$CountryFieldCopyWithImpl<$Res, CountryField>;
  @useResult
  $Res call({String flag, String countryName});
}

/// @nodoc
class _$CountryFieldCopyWithImpl<$Res, $Val extends CountryField>
    implements $CountryFieldCopyWith<$Res> {
  _$CountryFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flag = null,
    Object? countryName = null,
  }) {
    return _then(_value.copyWith(
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountryFieldCopyWith<$Res>
    implements $CountryFieldCopyWith<$Res> {
  factory _$$_CountryFieldCopyWith(
          _$_CountryField value, $Res Function(_$_CountryField) then) =
      __$$_CountryFieldCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String flag, String countryName});
}

/// @nodoc
class __$$_CountryFieldCopyWithImpl<$Res>
    extends _$CountryFieldCopyWithImpl<$Res, _$_CountryField>
    implements _$$_CountryFieldCopyWith<$Res> {
  __$$_CountryFieldCopyWithImpl(
      _$_CountryField _value, $Res Function(_$_CountryField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flag = null,
    Object? countryName = null,
  }) {
    return _then(_$_CountryField(
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CountryField extends _CountryField {
  const _$_CountryField({required this.flag, required this.countryName})
      : super._();

  @override
  final String flag;
  @override
  final String countryName;

  @override
  String toString() {
    return 'CountryField(flag: $flag, countryName: $countryName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountryField &&
            (identical(other.flag, flag) || other.flag == flag) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flag, countryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryFieldCopyWith<_$_CountryField> get copyWith =>
      __$$_CountryFieldCopyWithImpl<_$_CountryField>(this, _$identity);
}

abstract class _CountryField extends CountryField {
  const factory _CountryField(
      {required final String flag,
      required final String countryName}) = _$_CountryField;
  const _CountryField._() : super._();

  @override
  String get flag;
  @override
  String get countryName;
  @override
  @JsonKey(ignore: true)
  _$$_CountryFieldCopyWith<_$_CountryField> get copyWith =>
      throw _privateConstructorUsedError;
}
