import 'package:dio/dio.dart';
import 'package:flutter_practice/clases/auth_token.dart';
import 'package:retrofit/http.dart';

part 'api_oauth2.g.dart';

@RestApi(baseUrl: "https://identityserver-service.abexa.pe/oauth2/")
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST("/token")
  Future<AuthToken> authenticate({
    @Field("grant_type") required String grantType,
    @Field("scope") required String scope,
    @Field("username") required String username,
    @Field("password") required String password,
    @Field("client_id") required String clientId,
    @Field("client_secret") required String clientSecret,
  });
}
