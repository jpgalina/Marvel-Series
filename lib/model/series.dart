class Series {
  int? id;
  String? title;
  String? description;
  int? startYear;
  String? thumbnail;
  List? comics;
  List? characters;
  List? events;
  List? stories;
  List? creators;


  Series(
      {required this.id,
      required this.title,
      required this.startYear,
      required this.thumbnail,
      this.description,
      this.comics,
      this.characters,
      this.events,
      this.stories,
      this.creators});

  Series.fromJson(Map data) {
    id = data['id'];
    title = data['title'];
    description = data['description'];
    startYear = data['startYear'];
    thumbnail = data['thumbnail']['path'] + '.${data['thumbnail']['extension']}';
    // comics = data['comics']['items'];
    // characters = data['characters']['items'];
    // events = data['events']['items'];
    // stories = data['stories']['items'];
    // creators = data['creators']['items'];
  }
}
