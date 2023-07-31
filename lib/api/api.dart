import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:marvel_api/model/series.dart';
import '../utils/api_utils.dart';

const String publicKey = 'c8a07f06021bb59173515f64d26472ca';
const String privateKey = 'c6b36ee5eea1d1110c91141a8c10c311d80a1a93';
int offset = 100;

String _hash() {
  const String input = '1$privateKey$publicKey';
  return md5.convert(utf8.encode(input)).toString();
}

class API {
  static Future<List> getSeries() async {
    final endpoint = '/series?limit=100&ts=1&apikey=$publicKey&hash=${_hash()}';
    return fetchSeries(endpoint);
  }

  static Future<List> getMoreSeries(List list) async {
    final endpoint =
        '/series?limit=100&offset=$offset&ts=1&apikey=$publicKey&hash=${_hash()}';
    return fetchSeries(endpoint);
  }

  static Future<Series?> getSeriesById(Series series) async {
    final charEndpoint =
        '/series/${series.id}/characters?limit=100&ts=1&apikey=$publicKey&hash=${_hash()}';
    final comicsEndpoint =
        '/series/${series.id}/comics?limit=100&ts=1&apikey=$publicKey&hash=${_hash()}';
    final eventsEndpoint =
        '/series/${series.id}/events?limit=100&ts=1&apikey=$publicKey&hash=${_hash()}';
    final storiesEndpoint =
        '/series/${series.id}/stories?limit=100&ts=1&apikey=$publicKey&hash=${_hash()}';
    final creatorsEndpoint =
        '/series/${series.id}/creators?limit=100&ts=1&apikey=$publicKey&hash=${_hash()}';

    try {
      final charResponse = await fetchSeries(charEndpoint);
      final comicsResponse = await fetchSeries(comicsEndpoint);
      final eventsResponse = await fetchSeries(eventsEndpoint);
      final storiesResponse = await fetchSeries(storiesEndpoint);
      final creatorsResponse = await fetchSeries(creatorsEndpoint);

      series.characters = charResponse;
      series.comics = comicsResponse;
      series.events = eventsResponse;
      series.stories = storiesResponse;
      series.creators = creatorsResponse;

      return series;
    } on Exception catch (_) {
      return null;
    }
  }
}
