import 'dart:convert';
import 'dart:developer';
import 'dart:io';
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

  Future<http.Response> multipartPutRequest({
    required String authToken,
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, File>? files,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl/$endpoint');

      // Create a MultipartRequest
      final request = http.MultipartRequest("PUT", uri)
        ..headers.addAll({
          'Authorization': 'Bearer $authToken',
        });

      request.fields['body'] = json.encode(body);
      if (files != null) {
        for (final entry in files.entries) {
          final fileFieldName = entry.key;
          final file = entry.value;
          request.files
              .add(await http.MultipartFile.fromPath(fileFieldName, file.path));
        }
      }

      final response = await request.send();

      final responseBody = await response.stream.bytesToString();

      return http.Response(responseBody, response.statusCode);
    } catch (e) {
      log('Error during multipart PUT request: $e');
      rethrow;
    }
  }
}
