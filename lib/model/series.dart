class Series {
  int? id;
  String? title;
  int? startYear;
  Map<String, String>? thumbnail;

  Series({
    required this.id,
    required this.title,
    required this.startYear,
    required this.thumbnail,
  });

  Series.fromJson(Map data) {
    id = data['id'];
    title = data['title'];
    startYear = data['startYear'];
    thumbnail = data['thumbnail'];
  }
}
