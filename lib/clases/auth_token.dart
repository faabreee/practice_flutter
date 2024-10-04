import 'package:json_annotation/json_annotation.dart';

part 'auth_token.g.dart';

@JsonSerializable()
class AuthToken {
  final String access_token;
  final String refresh_token;
  final String scope;
  final String id_token;
  final String token_type;
  final int expires_in;

  AuthToken({
    required this.access_token,
    required this.refresh_token,
    required this.scope,
    required this.id_token,
    required this.token_type,
    required this.expires_in,
  });

  factory AuthToken.fromJson(Map<String, dynamic> json) => _$AuthTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenToJson(this);
}
