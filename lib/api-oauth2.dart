import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String tokenUrl = 'https://identityserver-service.abexa.pe/oauth2/token';
  final String apiUrl = 'https://beedronewebapi.abexa.pe/api/Qr/companies';

  String? accessToken;
  String? refreshToken;
  DateTime? tokenExpiration;

  Future<void> authenticate() async {
    final response = await http.post(Uri.parse(tokenUrl),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'grant_type': 'password',
        'scope': 'beex-manager-unitlinkerqr.read openid profile',
        'username': 'jhromero',
        'password': '1234',
        'client_id': 'WcBAU4Wqa117az0sgBFsFmqMxrUa',
        'client_secret': 'MCfIK1ZENbkD34ORyZyf9KfH9C8a',
      },
    );

    final data = json.decode(response.body);
    accessToken = data['access_token'];
    refreshToken = data['refresh_token'];
    tokenExpiration = DateTime.now().add(Duration(seconds: data['expires_in']));
  }

  Future<List<dynamic>> fetchCompanies() async {
    await authenticate();

    final response = await http.get(Uri.parse(apiUrl),
      headers: {
        'accept': 'text/plain',
        'Authorization': 'Bearer $accessToken',
      },
    );

    // log('Error fetching companies: ${response.body}');
    log('Acces Token ----_> ${accessToken}');
    log('Oauth url ----_> ${apiUrl}');

    final data = json.decode(response.body);
    return data['content'];

  }
}

class ApiOAuth2 extends StatefulWidget {
  @override
  _ApiOAuth2State createState() => _ApiOAuth2State();
}

class _ApiOAuth2State extends State<ApiOAuth2> {
  final ApiService apiService = ApiService();
  List<dynamic>? companies;

  @override
  void initState() {
    super.initState();
    apiService.authenticate();
  }

  void _getCompanies() async {
    final fetchedCompanies = await apiService.fetchCompanies();
    setState(() {
      companies = fetchedCompanies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getCompanies,
              child: const Text("Obtener api oauth2"),
            ),
            const SizedBox(height: 20),
            if (companies != null) 
              Expanded(
                child: ListView.builder(
                  itemCount: companies!.length,
                  itemBuilder: (context, index) {
                    final company = companies![index];
                    return ListTile(
                      title: Text("${company['nomEmpresa']}"),
                      subtitle: Text("Código: ${company['codEmpresa']}"),
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