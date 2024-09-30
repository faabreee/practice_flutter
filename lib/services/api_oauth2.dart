import 'package:dio/dio.dart';
import 'package:flutter_practice/clases/auth_token.dart';
import 'package:flutter_practice/clases/company.dart';
import 'package:retrofit/http.dart';

part 'api_oauth2.g.dart';

@RestApi(baseUrl: "https://identityserver-service.abexa.pe/oauth2/")
abstract class ApiServiceOAuth2 {
  factory ApiServiceOAuth2(Dio dio, {String baseUrl}) = _ApiServiceOAuth2;

  @POST("/token")
  Future<AuthToken> authenticate({
    @Field("grant_type") required String grantType,
    @Field("scope") required String scope,
    @Field("username") required String username,
    @Field("password") required String password,
    @Field("client_id") required String clientId,
    @Field("client_secret") required String clientSecret,
  });

  @GET("/api/Qr/companies")
  Future<List<Company>> fetchCompanies(@Header("Authorization") String authHeader);
}
