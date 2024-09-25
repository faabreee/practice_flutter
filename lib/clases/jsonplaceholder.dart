class JsonPlaceholder {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  JsonPlaceholder(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  factory JsonPlaceholder.fromJson(Map<String, dynamic> json) {
    return JsonPlaceholder(
        albumId: json['albumId'],
        id: json['id'],
        title: json['title'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl']);
  }
}
