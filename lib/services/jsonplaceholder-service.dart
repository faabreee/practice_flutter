import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_practice/clases/jsonplaceholder.dart';

Future<List<JsonPlaceholder>> getJsonPlaceholder() async{
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  final List<dynamic> data = json.decode(response.body);
    
  return data.map((jsonplaceholder) => JsonPlaceholder.fromJson(jsonplaceholder)).take(20).toList();
}