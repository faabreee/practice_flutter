// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) => AuthToken(
      access_token: json['access_token'] as String,
      refresh_token: json['refresh_token'] as String,
      scope: json['scope'] as String,
      id_token: json['id_token'] as String,
      token_type: json['token_type'] as String,
      expires_in: json['expires_in'] as int,
    );

Map<String, dynamic> _$AuthTokenToJson(AuthToken instance) => <String, dynamic>{
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
      'scope': instance.scope,
      'id_token': instance.id_token,
      'token_type': instance.token_type,
      'expires_in': instance.expires_in,
    };
