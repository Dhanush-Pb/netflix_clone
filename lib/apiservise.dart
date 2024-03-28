// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'dart:convert';

import 'package:netflix/Servises/apimodel.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/searchclass.dart';
import 'package:netflix/series.dart';

const apikey = '80531b7b924afce59755bcc666fbe529';

const Trendurl =
    'https://api.themoviedb.org/3/trending/movie/day?api_key=$apikey&language=en-US';
const Topurl =
    'https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey&language=en-US'; // Corrected URL

const upcoming =
    'https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey&language=en-US';
const tvshows =
    // ignore: unnecessary_brace_in_string_interps
    'https://api.themoviedb.org/3/trending/tv/?api_key=${apikey}&language=en-US';
Future<List<Movie>> Trendingmovie() async {
  final response = await http.get(Uri.parse(Trendurl));
  if (response.statusCode == 200) {
    final decodedData = jsonDecode(response.body)['results'] as List;

    List<Movie> movies =
        decodedData.map((data) => Movie.fromJson(data)).toList();

    return movies;
  } else {
    throw Exception('Failed to load trending movies');
  }
}

Future<List<Movie>> Topratedmovie() async {
  final response = await http.get(Uri.parse(Topurl));
  if (response.statusCode == 200) {
    final decodedData = jsonDecode(response.body)['results'] as List;

    List<Movie> movies =
        decodedData.map((data) => Movie.fromJson(data)).toList();

    return movies;
  } else {
    throw Exception(
        'Failed to load top-rated movies'); // Corrected error message
  }
}

Future<List<Movie>> Upcoming() async {
  final response = await http.get(Uri.parse(upcoming));
  if (response.statusCode == 200) {
    final decodedData = jsonDecode(response.body)['results'] as List;

    List<Movie> movies =
        decodedData.map((data) => Movie.fromJson(data)).toList();

    return movies;
  } else {
    throw Exception(
        'Failed to load top-rated movies'); // Corrected error message
  }
}

Future<List<Series>> tvDramas() async {
  const url = 'https://api.themoviedb.org/3/trending/tv/day?$apikey';

  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MDUzMWI3YjkyNGFmY2U1OTc1NWJjYzY2NmZiZTUyOSIsInN1YiI6IjY2MDI3Mjc3MDQ3MzNmMDE3ZGYwMTk2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.azCgs8fW3Vqd1Dhv4lATo-wbjQCQ98d18XSG3VSOAhw',
      'accept': 'application/json',
    },
  );

  final json = jsonDecode(response.body)["results"] as List;
  final result = json.map((e) => Series.fromjason(e)).toList();
  return result;
}

Future<List<SearchModel>> getSearchResults(String name) async {
  final searchurl = '/search/multi?query={name}&'.replaceFirst('{name}', name);
  final headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MDUzMWI3YjkyNGFmY2U1OTc1NWJjYzY2NmZiZTUyOSIsInN1YiI6IjY2MDI3Mjc3MDQ3MzNmMDE3ZGYwMTk2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.azCgs8fW3Vqd1Dhv4lATo-wbjQCQ98d18XSG3VSOAhw',
    'accept': 'application/json',
  };
  final response = await http.get(
    headers: headers,
    Uri.parse('https://api.themoviedb.org/3$searchurl$apikey'),
  );
  final decodedResult = jsonDecode(response.body)['results'] as List;

  final results =
      decodedResult.map((result) => SearchModel.fromJson(result)).toList();

  return results;
}
