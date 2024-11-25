import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:3000/api';

  Future<http.Response> getRequest(String endpoint, {String? authToken}) {
    return http.get(
      Uri.parse('$baseUrl/$endpoint'),
      headers: _buildHeaders(authToken),
    );
  }

  Future<http.Response> postRequest(String endpoint, Map<String, dynamic> body,
      {String? authToken}) {
    return http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: _buildHeaders(authToken),
      body: jsonEncode(body),
    );
  }

  Future<http.Response> putRequest(String endpoint, Map<String, dynamic> body,
      {String? authToken}) {
    return http.put(
      Uri.parse('$baseUrl/$endpoint'),
      headers: _buildHeaders(authToken),
      body: jsonEncode(body),
    );
  }

  Map<String, String> _buildHeaders(String? authToken) {
    final headers = <String, String>{
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    if (authToken != null && authToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $authToken';
    }

    return headers;
  }
}
