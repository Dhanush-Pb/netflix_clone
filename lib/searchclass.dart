import 'package:netflix/Servises/apimodel.dart';
import 'package:netflix/series.dart';

class SearchModel {
  Movie? movie;
  Series? series;

  SearchModel({this.movie, this.series});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('media_type')) {
      if (json['media_type'] == 'movie') {
        return SearchModel(
          movie: Movie(
            title: json['title'] ?? '',
            backtropPath: json['backdrop_path'] ?? '',
            orginaltitle: json['original_title'] ?? '',
            overviw: json['overview'] ?? '',
            posterpath: json['poster_path'] ?? '',
            voteavrage: json['vote_average']?.toDouble() ?? 0.0,
            relesedate: json['release_date'] ?? '',
          ),
        );
      } else if (json['media_type'] == 'tv') {
        return SearchModel(
          series: Series(
            name: json['name'] ?? '',
            posterImage: json['poster_path'] ?? '',
            overview: json['overview'] ?? '',
            coverImage: json['backdrop_path'] ?? '',
            popularity: json['popularity']?.toDouble() ?? 0.0,
            firstAirDate: json['first_air_date'] ?? '',
          ),
        );
      }
    }
    return SearchModel(); // Return empty SearchModel for any other cases
  }
}
