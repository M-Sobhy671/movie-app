class MovieModel {
  final int id;
  final String title;
  final String imageUrl;
  final double rating;
  final List<String> genres;

  MovieModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.genres,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['medium_cover_image'],
      rating: (json['rating'] ?? 0).toDouble(),
      genres: List<String>.from(json['genres'] ?? []),
    );
  }
}