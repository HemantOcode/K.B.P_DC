import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpRequest {
  static const header = {"Content-Type": "application/json"};

  postRequest({
    required String url,
    required Map<String, String> body,
  }) async {
    try {
      final response = await http.post(Uri.parse(url),
          headers: header, body: json.encode(body));

      return json.decode(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
