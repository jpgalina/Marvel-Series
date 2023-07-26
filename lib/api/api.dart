import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_api/model/series.dart';

const String baseurl = 'https://gateway.marvel.com:443/v1/public';
const String publicKey = 'c8a07f06021bb59173515f64d26472ca';
const String privateKey = 'c6b36ee5eea1d1110c91141a8c10c311d80a1a93';

String _hash() {
  const String input = '1$privateKey$publicKey';

  return md5.convert(utf8.encode(input)).toString();
}

class API {
  static Future<List<Series>> getSeries() async {
    final url =
        '$baseurl/series?limit=100&ts=1&apikey=$publicKey&hash=${_hash()}';
    var headers = {
      'Content-Type': 'application/json',
    };

    List<Series> list = [];

    try {
      var response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
        jsonResponse['data']['results']
            .forEach((series) => list.add(Series.fromJson(series)));
        return list;
      } else {
        throw Exception(response.body);
      }
    } on Exception catch (e) {
      return [];
    }
  }
}
