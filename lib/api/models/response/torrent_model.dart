class TorrentModel {
  final String url;
  final String quality;

  TorrentModel({
    required this.url,
    required this.quality,
  });

  factory TorrentModel.fromJson(Map<String, dynamic> json) {
    return TorrentModel(
      url: json["url"],
      quality: json["quality"],
    );
  }
}