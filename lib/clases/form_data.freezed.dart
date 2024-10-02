// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FormData _$FormDataFromJson(Map<String, dynamic> json) {
  return _FormData.fromJson(json);
}

/// @nodoc
mixin _$FormData {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormDataCopyWith<FormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormDataCopyWith<$Res> {
  factory $FormDataCopyWith(FormData value, $Res Function(FormData) then) =
      _$FormDataCopyWithImpl<$Res, FormData>;
  @useResult
  $Res call({String name, String email, String password});
}

/// @nodoc
class _$FormDataCopyWithImpl<$Res, $Val extends FormData>
    implements $FormDataCopyWith<$Res> {
  _$FormDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FormDataCopyWith<$Res> implements $FormDataCopyWith<$Res> {
  factory _$$_FormDataCopyWith(
          _$_FormData value, $Res Function(_$_FormData) then) =
      __$$_FormDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email, String password});
}

/// @nodoc
class __$$_FormDataCopyWithImpl<$Res>
    extends _$FormDataCopyWithImpl<$Res, _$_FormData>
    implements _$$_FormDataCopyWith<$Res> {
  __$$_FormDataCopyWithImpl(
      _$_FormData _value, $Res Function(_$_FormData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_FormData(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FormData implements _FormData {
  const _$_FormData(
      {required this.name, required this.email, required this.password});

  factory _$_FormData.fromJson(Map<String, dynamic> json) =>
      _$$_FormDataFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'FormData(name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormDataCopyWith<_$_FormData> get copyWith =>
      __$$_FormDataCopyWithImpl<_$_FormData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FormDataToJson(
      this,
    );
  }
}

abstract class _FormData implements FormData {
  const factory _FormData(
      {required final String name,
      required final String email,
      required final String password}) = _$_FormData;

  factory _FormData.fromJson(Map<String, dynamic> json) = _$_FormData.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_FormDataCopyWith<_$_FormData> get copyWith =>
      throw _privateConstructorUsedError;
}
