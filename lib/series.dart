class Series {
  final String name;

  String? posterImage;
  String? coverImage;
  final String overview;
  final double popularity;
  final String firstAirDate;

  Series(
      {required this.name,
      this.posterImage,
      required this.overview,
      this.coverImage,
      required this.popularity,
      required this.firstAirDate});

  factory Series.fromjason(Map<String, dynamic> json) => Series(
        name: json['name'],
        posterImage: json['poster_path'],
        overview: json['overview'],
        coverImage: json['backdrop_path'],
        popularity: json['popularity'],
        firstAirDate: json['first_air_date'],
      );
}
