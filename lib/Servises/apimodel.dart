class Movie {
  String title;
  String backtropPath;
  String orginaltitle;
  String overviw;
  String posterpath;
  String relesedate;
  double voteavrage;

  Movie({
    required this.title,
    required this.backtropPath,
    required this.orginaltitle,
    required this.overviw,
    required this.posterpath,
    required this.relesedate,
    required this.voteavrage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? '',
      backtropPath: json['backdrop_path'] ?? '',
      orginaltitle: json['original_title'] ?? '',
      overviw: json['overview'] ?? '',
      posterpath: json['poster_path'] ?? '',
      relesedate: json['release_date'] ?? '',
      voteavrage: (json['vote_average'] ?? 0.0).toDouble(),
    );
  }
}
