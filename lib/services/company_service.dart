import 'package:dio/dio.dart';
import 'package:flutter_practice/clases/company.dart';
import 'package:retrofit/http.dart';

part 'company_service.g.dart';

@RestApi(baseUrl: "https://beedronewebapi.abexa.pe/api/Qr/")
abstract class CompanyService {
  factory CompanyService(Dio dio, {String baseUrl}) = _CompanyService;

  @GET("/companies")
  Future<List<Company>> fetchCompanies(@Header("Authorization") String authHeader);
}
