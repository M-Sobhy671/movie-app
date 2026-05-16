class MoviesQueryModel {
  final int page;
  final int limit;

  MoviesQueryModel({
    this.page = 1,
    this.limit = 20,
  });

  Map<String, dynamic> toJson() {
    return {
      "page": page,
      "limit": limit,
    };
  }
}