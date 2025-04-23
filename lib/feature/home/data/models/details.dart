class DetailsModel {
  bool? adult;
  String? backdropPath;
  String? homepage;
  int? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  int? revenue;
  int? runtime;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  DetailsModel({
    this.adult,
    this.backdropPath,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  DetailsModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'] ?? '';
    homepage = json['homepage'] ?? '';
    id = json['id'];
    imdbId = json['imdb_id'] ?? '';
    originCountry = json['origin_country']?.cast<String>() ?? [];
    originalLanguage = json['original_language'] ?? '';
    originalTitle = json['original_title'] ?? '';
    overview = json['overview'] ?? '';
    popularity = json['popularity']?.toDouble();
    posterPath = json['poster_path'] ?? '';
    releaseDate = json['release_date'] ?? '';
    revenue = json['revenue'];
    runtime = json['runtime'];
    status = json['status'] ?? '';
    tagline = json['tagline'] ?? '';
    title = json['title'] ?? '';
    video = json['video'];
    voteAverage = json['vote_average']?.toDouble();
    voteCount = json['vote_count'];
  }
}