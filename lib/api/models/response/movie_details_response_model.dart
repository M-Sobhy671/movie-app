class MovieDetailsResponseModel {
  final dynamic data;

  MovieDetailsResponseModel({required this.data});

  factory MovieDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsResponseModel(
      data: json["data"],
    );
  }
}