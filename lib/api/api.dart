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

  static Future<Series?> getSeriesById(Series series) async {
    final charUrl =
        '$baseurl/series/${series.id}/characters?limit=100&ts=1&apikey=$publicKey&hash=${_hash()}';
    final comicsUrl =
        '$baseurl/series/${series.id}/comics?limit=100&ts=1&apikey=$publicKey&hash=${_hash()}';    
    final eventsUrl =
        '$baseurl/series/${series.id}/events?limit=100&ts=1&apikey=$publicKey&hash=${_hash()}';
    final storiesUrl =
        '$baseurl/series/${series.id}/stories?limit=100&ts=1&apikey=$publicKey&hash=${_hash()}'; 
    final creatorsUrl =
        '$baseurl/series/${series.id}/creators?limit=100&ts=1&apikey=$publicKey&hash=${_hash()}';       
    var headers = {
      'Content-Type': 'application/json',
    };

    bool anySuccess = false;


    try {
      var charResponse = await http.get(Uri.parse(charUrl), headers: headers);
      var comicsResponse = await http.get(Uri.parse(comicsUrl), headers: headers);
      var eventsResponse = await http.get(Uri.parse(eventsUrl), headers: headers);
      var storiesResponse = await http.get(Uri.parse(storiesUrl), headers: headers);
      var creatorsResponse = await http.get(Uri.parse(creatorsUrl), headers: headers);

      if (charResponse.statusCode == 200) {
        var jsonCharResponse = jsonDecode(utf8.decode(charResponse.bodyBytes));
        // newSeries = Series.fromJson(jsonResponse['data']['results'][0]);
        series.characters = jsonCharResponse['data']['results'];
        anySuccess = true;
      }

      if (comicsResponse.statusCode == 200) {
        var jsonComicsResponse = jsonDecode(utf8.decode(comicsResponse.bodyBytes));
        // newSeries = Series.fromJson(jsonResponse['data']['results'][0]);
        series.comics = jsonComicsResponse['data']['results'];
        anySuccess = true;
      }

      if (eventsResponse.statusCode == 200) {
        var jsonEventsResponse = jsonDecode(utf8.decode(eventsResponse.bodyBytes));
        // newSeries = Series.fromJson(jsonResponse['data']['results'][0]);
        series.events = jsonEventsResponse['data']['results'];
        anySuccess = true;
      }

      if (storiesResponse.statusCode == 200) {
        var jsonStoriesResponse = jsonDecode(utf8.decode(storiesResponse.bodyBytes));
        // newSeries = Series.fromJson(jsonResponse['data']['results'][0]);
        series.stories = jsonStoriesResponse['data']['results'];
        anySuccess = true;
      }

      if (creatorsResponse.statusCode == 200) {
        var jsonCreatorsResponse = jsonDecode(utf8.decode(creatorsResponse.bodyBytes));
        // newSeries = Series.fromJson(jsonResponse['data']['results'][0]);
        series.creators = jsonCreatorsResponse['data']['results'];
        anySuccess = true;
      }

      if(anySuccess){
        return series;
      }
      else {
        throw Exception();
      }
    } on Exception catch (e) {
      return null;
    }
  }
}
