import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_data.freezed.dart';
part 'form_data.g.dart';

@freezed
class FormData with _$FormData {
  const factory FormData({
    required String name,
    required String email,
    required String password,
  }) = _FormData;

  factory FormData.fromJson(Map<String, dynamic> json) => _$FormDataFromJson(json);
}
