import 'dart:convert';

import 'package:http/http.dart' as http;

  postRequest({
    required String url,
    String token = '',
    required Map<String, dynamic> body,
  }) async {
    final header = {
      "Content-Type": "application/json",
      'Authorization': 'Barer $token'
    };
    try {
      final response = await http.post(Uri.parse(url),
          headers: header, body: json.encode(body));

      return json.decode(response.body);
    } catch (e) {
      rethrow;
    }
  }

