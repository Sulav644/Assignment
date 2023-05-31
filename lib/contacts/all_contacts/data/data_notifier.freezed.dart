// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PagedDataState {
  Fresh<List<Data>> get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Data>> data) initial,
    required TResult Function(Fresh<List<Data>> data) loadInProgress,
    required TResult Function(Fresh<List<Data>> data) loadSuccess,
    required TResult Function(Fresh<List<Data>> data) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<Data>> data)? initial,
    TResult? Function(Fresh<List<Data>> data)? loadInProgress,
    TResult? Function(Fresh<List<Data>> data)? loadSuccess,
    TResult? Function(Fresh<List<Data>> data)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Data>> data)? initial,
    TResult Function(Fresh<List<Data>> data)? loadInProgress,
    TResult Function(Fresh<List<Data>> data)? loadSuccess,
    TResult Function(Fresh<List<Data>> data)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PagedDataStateCopyWith<PagedDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagedDataStateCopyWith<$Res> {
  factory $PagedDataStateCopyWith(
          PagedDataState value, $Res Function(PagedDataState) then) =
      _$PagedDataStateCopyWithImpl<$Res, PagedDataState>;
  @useResult
  $Res call({Fresh<List<Data>> data});

  $FreshCopyWith<List<Data>, $Res> get data;
}

/// @nodoc
class _$PagedDataStateCopyWithImpl<$Res, $Val extends PagedDataState>
    implements $PagedDataStateCopyWith<$Res> {
  _$PagedDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Data>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FreshCopyWith<List<Data>, $Res> get data {
    return $FreshCopyWith<List<Data>, $Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $PagedDataStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<Data>> data});

  @override
  $FreshCopyWith<List<Data>, $Res> get data;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$PagedDataStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_Initial(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Data>>,
    ));
  }
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial(this.data) : super._();

  @override
  final Fresh<List<Data>> data;

  @override
  String toString() {
    return 'PagedDataState.initial(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Data>> data) initial,
    required TResult Function(Fresh<List<Data>> data) loadInProgress,
    required TResult Function(Fresh<List<Data>> data) loadSuccess,
    required TResult Function(Fresh<List<Data>> data) loadFailure,
  }) {
    return initial(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<Data>> data)? initial,
    TResult? Function(Fresh<List<Data>> data)? loadInProgress,
    TResult? Function(Fresh<List<Data>> data)? loadSuccess,
    TResult? Function(Fresh<List<Data>> data)? loadFailure,
  }) {
    return initial?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Data>> data)? initial,
    TResult Function(Fresh<List<Data>> data)? loadInProgress,
    TResult Function(Fresh<List<Data>> data)? loadSuccess,
    TResult Function(Fresh<List<Data>> data)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends PagedDataState {
  const factory _Initial(final Fresh<List<Data>> data) = _$_Initial;
  const _Initial._() : super._();

  @override
  Fresh<List<Data>> get data;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadInProgressCopyWith<$Res>
    implements $PagedDataStateCopyWith<$Res> {
  factory _$$_LoadInProgressCopyWith(
          _$_LoadInProgress value, $Res Function(_$_LoadInProgress) then) =
      __$$_LoadInProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<Data>> data});

  @override
  $FreshCopyWith<List<Data>, $Res> get data;
}

/// @nodoc
class __$$_LoadInProgressCopyWithImpl<$Res>
    extends _$PagedDataStateCopyWithImpl<$Res, _$_LoadInProgress>
    implements _$$_LoadInProgressCopyWith<$Res> {
  __$$_LoadInProgressCopyWithImpl(
      _$_LoadInProgress _value, $Res Function(_$_LoadInProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_LoadInProgress(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Data>>,
    ));
  }
}

/// @nodoc

class _$_LoadInProgress extends _LoadInProgress {
  const _$_LoadInProgress(this.data) : super._();

  @override
  final Fresh<List<Data>> data;

  @override
  String toString() {
    return 'PagedDataState.loadInProgress(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadInProgress &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadInProgressCopyWith<_$_LoadInProgress> get copyWith =>
      __$$_LoadInProgressCopyWithImpl<_$_LoadInProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Data>> data) initial,
    required TResult Function(Fresh<List<Data>> data) loadInProgress,
    required TResult Function(Fresh<List<Data>> data) loadSuccess,
    required TResult Function(Fresh<List<Data>> data) loadFailure,
  }) {
    return loadInProgress(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<Data>> data)? initial,
    TResult? Function(Fresh<List<Data>> data)? loadInProgress,
    TResult? Function(Fresh<List<Data>> data)? loadSuccess,
    TResult? Function(Fresh<List<Data>> data)? loadFailure,
  }) {
    return loadInProgress?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Data>> data)? initial,
    TResult Function(Fresh<List<Data>> data)? loadInProgress,
    TResult Function(Fresh<List<Data>> data)? loadSuccess,
    TResult Function(Fresh<List<Data>> data)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress extends PagedDataState {
  const factory _LoadInProgress(final Fresh<List<Data>> data) =
      _$_LoadInProgress;
  const _LoadInProgress._() : super._();

  @override
  Fresh<List<Data>> get data;
  @override
  @JsonKey(ignore: true)
  _$$_LoadInProgressCopyWith<_$_LoadInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadSuccessCopyWith<$Res>
    implements $PagedDataStateCopyWith<$Res> {
  factory _$$_LoadSuccessCopyWith(
          _$_LoadSuccess value, $Res Function(_$_LoadSuccess) then) =
      __$$_LoadSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<Data>> data});

  @override
  $FreshCopyWith<List<Data>, $Res> get data;
}

/// @nodoc
class __$$_LoadSuccessCopyWithImpl<$Res>
    extends _$PagedDataStateCopyWithImpl<$Res, _$_LoadSuccess>
    implements _$$_LoadSuccessCopyWith<$Res> {
  __$$_LoadSuccessCopyWithImpl(
      _$_LoadSuccess _value, $Res Function(_$_LoadSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_LoadSuccess(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Data>>,
    ));
  }
}

/// @nodoc

class _$_LoadSuccess extends _LoadSuccess {
  const _$_LoadSuccess(this.data) : super._();

  @override
  final Fresh<List<Data>> data;

  @override
  String toString() {
    return 'PagedDataState.loadSuccess(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadSuccess &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      __$$_LoadSuccessCopyWithImpl<_$_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Data>> data) initial,
    required TResult Function(Fresh<List<Data>> data) loadInProgress,
    required TResult Function(Fresh<List<Data>> data) loadSuccess,
    required TResult Function(Fresh<List<Data>> data) loadFailure,
  }) {
    return loadSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<Data>> data)? initial,
    TResult? Function(Fresh<List<Data>> data)? loadInProgress,
    TResult? Function(Fresh<List<Data>> data)? loadSuccess,
    TResult? Function(Fresh<List<Data>> data)? loadFailure,
  }) {
    return loadSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Data>> data)? initial,
    TResult Function(Fresh<List<Data>> data)? loadInProgress,
    TResult Function(Fresh<List<Data>> data)? loadSuccess,
    TResult Function(Fresh<List<Data>> data)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess extends PagedDataState {
  const factory _LoadSuccess(final Fresh<List<Data>> data) = _$_LoadSuccess;
  const _LoadSuccess._() : super._();

  @override
  Fresh<List<Data>> get data;
  @override
  @JsonKey(ignore: true)
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadFailureCopyWith<$Res>
    implements $PagedDataStateCopyWith<$Res> {
  factory _$$_LoadFailureCopyWith(
          _$_LoadFailure value, $Res Function(_$_LoadFailure) then) =
      __$$_LoadFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<Data>> data});

  @override
  $FreshCopyWith<List<Data>, $Res> get data;
}

/// @nodoc
class __$$_LoadFailureCopyWithImpl<$Res>
    extends _$PagedDataStateCopyWithImpl<$Res, _$_LoadFailure>
    implements _$$_LoadFailureCopyWith<$Res> {
  __$$_LoadFailureCopyWithImpl(
      _$_LoadFailure _value, $Res Function(_$_LoadFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_LoadFailure(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Data>>,
    ));
  }
}

/// @nodoc

class _$_LoadFailure extends _LoadFailure {
  const _$_LoadFailure(this.data) : super._();

  @override
  final Fresh<List<Data>> data;

  @override
  String toString() {
    return 'PagedDataState.loadFailure(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadFailure &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadFailureCopyWith<_$_LoadFailure> get copyWith =>
      __$$_LoadFailureCopyWithImpl<_$_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Data>> data) initial,
    required TResult Function(Fresh<List<Data>> data) loadInProgress,
    required TResult Function(Fresh<List<Data>> data) loadSuccess,
    required TResult Function(Fresh<List<Data>> data) loadFailure,
  }) {
    return loadFailure(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<Data>> data)? initial,
    TResult? Function(Fresh<List<Data>> data)? loadInProgress,
    TResult? Function(Fresh<List<Data>> data)? loadSuccess,
    TResult? Function(Fresh<List<Data>> data)? loadFailure,
  }) {
    return loadFailure?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Data>> data)? initial,
    TResult Function(Fresh<List<Data>> data)? loadInProgress,
    TResult Function(Fresh<List<Data>> data)? loadSuccess,
    TResult Function(Fresh<List<Data>> data)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure extends PagedDataState {
  const factory _LoadFailure(final Fresh<List<Data>> data) = _$_LoadFailure;
  const _LoadFailure._() : super._();

  @override
  Fresh<List<Data>> get data;
  @override
  @JsonKey(ignore: true)
  _$$_LoadFailureCopyWith<_$_LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SinglePagedDataState {
  Fresh<Data> get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<Data> data) initial,
    required TResult Function(Fresh<Data> data) loadInProgress,
    required TResult Function(Fresh<Data> data) loadSuccess,
    required TResult Function(Fresh<Data> data) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<Data> data)? initial,
    TResult? Function(Fresh<Data> data)? loadInProgress,
    TResult? Function(Fresh<Data> data)? loadSuccess,
    TResult? Function(Fresh<Data> data)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<Data> data)? initial,
    TResult Function(Fresh<Data> data)? loadInProgress,
    TResult Function(Fresh<Data> data)? loadSuccess,
    TResult Function(Fresh<Data> data)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SingleInitial value) initial,
    required TResult Function(_SingleLoadInProgress value) loadInProgress,
    required TResult Function(_SingleLoadSuccess value) loadSuccess,
    required TResult Function(_SingleLoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SingleInitial value)? initial,
    TResult? Function(_SingleLoadInProgress value)? loadInProgress,
    TResult? Function(_SingleLoadSuccess value)? loadSuccess,
    TResult? Function(_SingleLoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SingleInitial value)? initial,
    TResult Function(_SingleLoadInProgress value)? loadInProgress,
    TResult Function(_SingleLoadSuccess value)? loadSuccess,
    TResult Function(_SingleLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SinglePagedDataStateCopyWith<SinglePagedDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SinglePagedDataStateCopyWith<$Res> {
  factory $SinglePagedDataStateCopyWith(SinglePagedDataState value,
          $Res Function(SinglePagedDataState) then) =
      _$SinglePagedDataStateCopyWithImpl<$Res, SinglePagedDataState>;
  @useResult
  $Res call({Fresh<Data> data});

  $FreshCopyWith<Data, $Res> get data;
}

/// @nodoc
class _$SinglePagedDataStateCopyWithImpl<$Res,
        $Val extends SinglePagedDataState>
    implements $SinglePagedDataStateCopyWith<$Res> {
  _$SinglePagedDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Fresh<Data>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FreshCopyWith<Data, $Res> get data {
    return $FreshCopyWith<Data, $Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SingleInitialCopyWith<$Res>
    implements $SinglePagedDataStateCopyWith<$Res> {
  factory _$$_SingleInitialCopyWith(
          _$_SingleInitial value, $Res Function(_$_SingleInitial) then) =
      __$$_SingleInitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<Data> data});

  @override
  $FreshCopyWith<Data, $Res> get data;
}

/// @nodoc
class __$$_SingleInitialCopyWithImpl<$Res>
    extends _$SinglePagedDataStateCopyWithImpl<$Res, _$_SingleInitial>
    implements _$$_SingleInitialCopyWith<$Res> {
  __$$_SingleInitialCopyWithImpl(
      _$_SingleInitial _value, $Res Function(_$_SingleInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_SingleInitial(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Fresh<Data>,
    ));
  }
}

/// @nodoc

class _$_SingleInitial extends _SingleInitial {
  const _$_SingleInitial(this.data) : super._();

  @override
  final Fresh<Data> data;

  @override
  String toString() {
    return 'SinglePagedDataState.initial(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SingleInitial &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SingleInitialCopyWith<_$_SingleInitial> get copyWith =>
      __$$_SingleInitialCopyWithImpl<_$_SingleInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<Data> data) initial,
    required TResult Function(Fresh<Data> data) loadInProgress,
    required TResult Function(Fresh<Data> data) loadSuccess,
    required TResult Function(Fresh<Data> data) loadFailure,
  }) {
    return initial(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<Data> data)? initial,
    TResult? Function(Fresh<Data> data)? loadInProgress,
    TResult? Function(Fresh<Data> data)? loadSuccess,
    TResult? Function(Fresh<Data> data)? loadFailure,
  }) {
    return initial?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<Data> data)? initial,
    TResult Function(Fresh<Data> data)? loadInProgress,
    TResult Function(Fresh<Data> data)? loadSuccess,
    TResult Function(Fresh<Data> data)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SingleInitial value) initial,
    required TResult Function(_SingleLoadInProgress value) loadInProgress,
    required TResult Function(_SingleLoadSuccess value) loadSuccess,
    required TResult Function(_SingleLoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SingleInitial value)? initial,
    TResult? Function(_SingleLoadInProgress value)? loadInProgress,
    TResult? Function(_SingleLoadSuccess value)? loadSuccess,
    TResult? Function(_SingleLoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SingleInitial value)? initial,
    TResult Function(_SingleLoadInProgress value)? loadInProgress,
    TResult Function(_SingleLoadSuccess value)? loadSuccess,
    TResult Function(_SingleLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SingleInitial extends SinglePagedDataState {
  const factory _SingleInitial(final Fresh<Data> data) = _$_SingleInitial;
  const _SingleInitial._() : super._();

  @override
  Fresh<Data> get data;
  @override
  @JsonKey(ignore: true)
  _$$_SingleInitialCopyWith<_$_SingleInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SingleLoadInProgressCopyWith<$Res>
    implements $SinglePagedDataStateCopyWith<$Res> {
  factory _$$_SingleLoadInProgressCopyWith(_$_SingleLoadInProgress value,
          $Res Function(_$_SingleLoadInProgress) then) =
      __$$_SingleLoadInProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<Data> data});

  @override
  $FreshCopyWith<Data, $Res> get data;
}

/// @nodoc
class __$$_SingleLoadInProgressCopyWithImpl<$Res>
    extends _$SinglePagedDataStateCopyWithImpl<$Res, _$_SingleLoadInProgress>
    implements _$$_SingleLoadInProgressCopyWith<$Res> {
  __$$_SingleLoadInProgressCopyWithImpl(_$_SingleLoadInProgress _value,
      $Res Function(_$_SingleLoadInProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_SingleLoadInProgress(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Fresh<Data>,
    ));
  }
}

/// @nodoc

class _$_SingleLoadInProgress extends _SingleLoadInProgress {
  const _$_SingleLoadInProgress(this.data) : super._();

  @override
  final Fresh<Data> data;

  @override
  String toString() {
    return 'SinglePagedDataState.loadInProgress(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SingleLoadInProgress &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SingleLoadInProgressCopyWith<_$_SingleLoadInProgress> get copyWith =>
      __$$_SingleLoadInProgressCopyWithImpl<_$_SingleLoadInProgress>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<Data> data) initial,
    required TResult Function(Fresh<Data> data) loadInProgress,
    required TResult Function(Fresh<Data> data) loadSuccess,
    required TResult Function(Fresh<Data> data) loadFailure,
  }) {
    return loadInProgress(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<Data> data)? initial,
    TResult? Function(Fresh<Data> data)? loadInProgress,
    TResult? Function(Fresh<Data> data)? loadSuccess,
    TResult? Function(Fresh<Data> data)? loadFailure,
  }) {
    return loadInProgress?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<Data> data)? initial,
    TResult Function(Fresh<Data> data)? loadInProgress,
    TResult Function(Fresh<Data> data)? loadSuccess,
    TResult Function(Fresh<Data> data)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SingleInitial value) initial,
    required TResult Function(_SingleLoadInProgress value) loadInProgress,
    required TResult Function(_SingleLoadSuccess value) loadSuccess,
    required TResult Function(_SingleLoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SingleInitial value)? initial,
    TResult? Function(_SingleLoadInProgress value)? loadInProgress,
    TResult? Function(_SingleLoadSuccess value)? loadSuccess,
    TResult? Function(_SingleLoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SingleInitial value)? initial,
    TResult Function(_SingleLoadInProgress value)? loadInProgress,
    TResult Function(_SingleLoadSuccess value)? loadSuccess,
    TResult Function(_SingleLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _SingleLoadInProgress extends SinglePagedDataState {
  const factory _SingleLoadInProgress(final Fresh<Data> data) =
      _$_SingleLoadInProgress;
  const _SingleLoadInProgress._() : super._();

  @override
  Fresh<Data> get data;
  @override
  @JsonKey(ignore: true)
  _$$_SingleLoadInProgressCopyWith<_$_SingleLoadInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SingleLoadSuccessCopyWith<$Res>
    implements $SinglePagedDataStateCopyWith<$Res> {
  factory _$$_SingleLoadSuccessCopyWith(_$_SingleLoadSuccess value,
          $Res Function(_$_SingleLoadSuccess) then) =
      __$$_SingleLoadSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<Data> data});

  @override
  $FreshCopyWith<Data, $Res> get data;
}

/// @nodoc
class __$$_SingleLoadSuccessCopyWithImpl<$Res>
    extends _$SinglePagedDataStateCopyWithImpl<$Res, _$_SingleLoadSuccess>
    implements _$$_SingleLoadSuccessCopyWith<$Res> {
  __$$_SingleLoadSuccessCopyWithImpl(
      _$_SingleLoadSuccess _value, $Res Function(_$_SingleLoadSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_SingleLoadSuccess(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Fresh<Data>,
    ));
  }
}

/// @nodoc

class _$_SingleLoadSuccess extends _SingleLoadSuccess {
  const _$_SingleLoadSuccess(this.data) : super._();

  @override
  final Fresh<Data> data;

  @override
  String toString() {
    return 'SinglePagedDataState.loadSuccess(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SingleLoadSuccess &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SingleLoadSuccessCopyWith<_$_SingleLoadSuccess> get copyWith =>
      __$$_SingleLoadSuccessCopyWithImpl<_$_SingleLoadSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<Data> data) initial,
    required TResult Function(Fresh<Data> data) loadInProgress,
    required TResult Function(Fresh<Data> data) loadSuccess,
    required TResult Function(Fresh<Data> data) loadFailure,
  }) {
    return loadSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<Data> data)? initial,
    TResult? Function(Fresh<Data> data)? loadInProgress,
    TResult? Function(Fresh<Data> data)? loadSuccess,
    TResult? Function(Fresh<Data> data)? loadFailure,
  }) {
    return loadSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<Data> data)? initial,
    TResult Function(Fresh<Data> data)? loadInProgress,
    TResult Function(Fresh<Data> data)? loadSuccess,
    TResult Function(Fresh<Data> data)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SingleInitial value) initial,
    required TResult Function(_SingleLoadInProgress value) loadInProgress,
    required TResult Function(_SingleLoadSuccess value) loadSuccess,
    required TResult Function(_SingleLoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SingleInitial value)? initial,
    TResult? Function(_SingleLoadInProgress value)? loadInProgress,
    TResult? Function(_SingleLoadSuccess value)? loadSuccess,
    TResult? Function(_SingleLoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SingleInitial value)? initial,
    TResult Function(_SingleLoadInProgress value)? loadInProgress,
    TResult Function(_SingleLoadSuccess value)? loadSuccess,
    TResult Function(_SingleLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _SingleLoadSuccess extends SinglePagedDataState {
  const factory _SingleLoadSuccess(final Fresh<Data> data) =
      _$_SingleLoadSuccess;
  const _SingleLoadSuccess._() : super._();

  @override
  Fresh<Data> get data;
  @override
  @JsonKey(ignore: true)
  _$$_SingleLoadSuccessCopyWith<_$_SingleLoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SingleLoadFailureCopyWith<$Res>
    implements $SinglePagedDataStateCopyWith<$Res> {
  factory _$$_SingleLoadFailureCopyWith(_$_SingleLoadFailure value,
          $Res Function(_$_SingleLoadFailure) then) =
      __$$_SingleLoadFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<Data> data});

  @override
  $FreshCopyWith<Data, $Res> get data;
}

/// @nodoc
class __$$_SingleLoadFailureCopyWithImpl<$Res>
    extends _$SinglePagedDataStateCopyWithImpl<$Res, _$_SingleLoadFailure>
    implements _$$_SingleLoadFailureCopyWith<$Res> {
  __$$_SingleLoadFailureCopyWithImpl(
      _$_SingleLoadFailure _value, $Res Function(_$_SingleLoadFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_SingleLoadFailure(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Fresh<Data>,
    ));
  }
}

/// @nodoc

class _$_SingleLoadFailure extends _SingleLoadFailure {
  const _$_SingleLoadFailure(this.data) : super._();

  @override
  final Fresh<Data> data;

  @override
  String toString() {
    return 'SinglePagedDataState.loadFailure(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SingleLoadFailure &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SingleLoadFailureCopyWith<_$_SingleLoadFailure> get copyWith =>
      __$$_SingleLoadFailureCopyWithImpl<_$_SingleLoadFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<Data> data) initial,
    required TResult Function(Fresh<Data> data) loadInProgress,
    required TResult Function(Fresh<Data> data) loadSuccess,
    required TResult Function(Fresh<Data> data) loadFailure,
  }) {
    return loadFailure(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<Data> data)? initial,
    TResult? Function(Fresh<Data> data)? loadInProgress,
    TResult? Function(Fresh<Data> data)? loadSuccess,
    TResult? Function(Fresh<Data> data)? loadFailure,
  }) {
    return loadFailure?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<Data> data)? initial,
    TResult Function(Fresh<Data> data)? loadInProgress,
    TResult Function(Fresh<Data> data)? loadSuccess,
    TResult Function(Fresh<Data> data)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SingleInitial value) initial,
    required TResult Function(_SingleLoadInProgress value) loadInProgress,
    required TResult Function(_SingleLoadSuccess value) loadSuccess,
    required TResult Function(_SingleLoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SingleInitial value)? initial,
    TResult? Function(_SingleLoadInProgress value)? loadInProgress,
    TResult? Function(_SingleLoadSuccess value)? loadSuccess,
    TResult? Function(_SingleLoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SingleInitial value)? initial,
    TResult Function(_SingleLoadInProgress value)? loadInProgress,
    TResult Function(_SingleLoadSuccess value)? loadSuccess,
    TResult Function(_SingleLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _SingleLoadFailure extends SinglePagedDataState {
  const factory _SingleLoadFailure(final Fresh<Data> data) =
      _$_SingleLoadFailure;
  const _SingleLoadFailure._() : super._();

  @override
  Fresh<Data> get data;
  @override
  @JsonKey(ignore: true)
  _$$_SingleLoadFailureCopyWith<_$_SingleLoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
