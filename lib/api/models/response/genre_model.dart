class GenreModel {
  final String name;

  GenreModel({required this.name});

  factory GenreModel.fromJson(String json) {
    return GenreModel(name: json);
  }
}