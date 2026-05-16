class MovieEntity {
  final int id;
  final String title;
  final String imageUrl;
  final double rating;
  final List<String> genres;

  MovieEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.genres,
  });
}