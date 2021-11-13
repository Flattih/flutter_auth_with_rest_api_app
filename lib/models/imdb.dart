class Imdb {
  final String title;
  final int year;
  final String titleType;

  Imdb(
      {required this.title,
      required this.year,
      required this.titleType});

  factory Imdb.fromJson(dynamic json) {
    return Imdb(
        title: json["title"] as String,
        year: json["year"] as int,
        titleType: json["titleType"] as String);
  }

  static List<Imdb> imdbFromSnapshot(List snapshot) {
    return snapshot.map((e) => Imdb.fromJson(e)).toList();
  }
  @override
  String toString() {
    return 'Imdb {title: $title,year: $year,titleType: $titleType}';
  }
}
