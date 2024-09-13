class Pokemon {
  final String name;
  final String url;

  Pokemon({required this.name, required this.url});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      url: json['url'],
    );
  }

  String get id {
    final uri = Uri.parse(url);
    return uri.pathSegments[uri.pathSegments.length - 2];
  }

  String get imageUrl {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }
}
