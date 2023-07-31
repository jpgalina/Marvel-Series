import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvel_api/model/series.dart';

const String baseurl = 'https://gateway.marvel.com:443/v1/public';

final Map<String, String> _headers = {
  'Content-Type': 'application/json',
};

Uri buildUri(String endpoint) {
  return Uri.parse('$baseurl$endpoint');
}

Future<List> fetchSeries(String endpoint) async {
  final url = buildUri(endpoint);
  final response = await http.get(url, headers: _headers);
  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
    if (endpoint.contains('/characters') ||
        endpoint.contains('/comics') ||
        endpoint.contains('/events') ||
        endpoint.contains('/stories') ||
        endpoint.contains('/creators')) {
      return jsonResponse['data']['results'];
    } else {
      return List<Series>.from(jsonResponse['data']['results']
          .map((series) => Series.fromJson(series)));
    }
  } else {
    throw Exception(response.body);
  }
}
