import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_practice/clases/auth_token.dart';
import 'package:flutter_practice/clases/company.dart';
import 'package:flutter_practice/services/api_oauth2.dart';
import 'package:flutter_practice/services/company_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final Dio _dio = Dio();
  late final AuthService _authService;
  late final CompanyService _companyService;

  String? accessToken;
  String? refreshToken;
  DateTime? tokenExpiration;

  ApiService() {
    _authService = AuthService(_dio);
    _companyService = CompanyService(_dio, baseUrl: dotenv.env['URL_API']!);
  }

  Future<void> authenticate() async {
    try {
      final AuthToken authToken = await _authService.authenticate(
        grantType: 'password',
        scope: 'openid beex-mobile.read beex-mobile.write  profile monitor-logging.read monitor-logging.write openid beex-payment.read beex-payment.write',
        username: 'beex-mobile-app',
        password: 'beex-mobile-app',            
        authorization: 'Basic WWJvNGJNYmRuQXV1MllQRmtDNHpBek9KZ3BVYTpZTTF2ejJSNlhGdjllU2FBckxmaVhDYTZhMVVh'                                             
      );
      log(authToken.toString());
      print(authToken);
      accessToken = authToken.accessToken;
      refreshToken = authToken.refreshToken;
      tokenExpiration = DateTime.now().add(Duration(seconds: authToken.expiresIn));
    } catch (e) {
      print("Error during authentication: $e");
    }
  }

  Future<List<Company>> getCompanies() async {
    try {
      if (accessToken == null || tokenExpiration!.isBefore(DateTime.now())) {
        await authenticate();
      }

      final companies = await _companyService.fetchCompanies('Bearer $accessToken');
      return companies;
    } catch (e) {
      print("Error fetching companies: $e");
      return [];
    }
  }
}

class ApiOAuth2 extends StatefulWidget {
  @override
  _ApiOAuth2State createState() => _ApiOAuth2State();
}

class _ApiOAuth2State extends State<ApiOAuth2> {
  final ApiService apiService = ApiService();
  List<Company>? companies;

  @override
  void initState() {
    super.initState();
    apiService.authenticate();
  }

  void _getCompanies() async {
    final fetchedCompanies = await apiService.getCompanies();
    setState(() {
      companies = fetchedCompanies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API OAuth2 Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getCompanies,
              child: const Text("Obtener API OAuth2"),
            ),
            const SizedBox(height: 20),
            if (companies != null)
              Expanded(
                child: ListView.builder(
                  itemCount: companies!.length,
                  itemBuilder: (context, index) {
                    final company = companies![index];
                    return ListTile(
                      title: Text("${company.nomEmpresa}"),
                      subtitle: Text("Código: ${company.codEmpresa}"),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}