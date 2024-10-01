import 'package:json_annotation/json_annotation.dart';

part 'auth_token.g.dart';

@JsonSerializable()
class AuthToken {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;

  AuthToken({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  factory AuthToken.fromJson(Map<String, dynamic> json) => _$AuthTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenToJson(this);
}
