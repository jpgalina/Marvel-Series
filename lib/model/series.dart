class Series {
  int? id;
  String? title;
  String? description;
  int? startYear;
  Map<String, dynamic>? thumbnail;

  Series(
      {required this.id,
      required this.title,
      required this.startYear,
      required this.thumbnail,
      this.description});

  Series.fromJson(Map data) {
    id = data['id'];
    title = data['title'];
    description = data['description'];
    startYear = data['startYear'];
    thumbnail = data['thumbnail'];
  }
}
