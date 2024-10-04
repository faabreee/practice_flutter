import 'package:dio/dio.dart';
import 'package:flutter_practice/clases/auth_token.dart';
import 'package:retrofit/http.dart';

part 'api_oauth2.g.dart';

@RestApi(baseUrl: "https://wso2is-service.abexa.pe")
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST("/oauth2/token")
  Future<AuthToken> authenticate({
    @Field("grant_type") required String grantType,
    @Field("scope") required String scope,
    @Field("username") required String username,
    @Field("password") required String password,
    @Header("Authorization") String? authorization,
  });
}
