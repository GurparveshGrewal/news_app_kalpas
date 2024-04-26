import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteServicesWrapper {
  Future<List> getNews() async {
    try {
      final client = http.Client();

      final uri = Uri.parse(
          'https://newsapi.org/v2/everything?q=tesla&from=2024-04-24&sortBy=publishedAt&apiKey=aa560b0417c64873a12c096b42d086d9');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return json['articles'];
      }

      return [];
    } catch (e) {
      rethrow;
    }
  }
}
