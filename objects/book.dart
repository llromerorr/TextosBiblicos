import 'chapter.dart';

class Book{
  String title;
  String description;
  String abbreviation;
  List<Chapter> chapters;

  Book({this.title, this.description, this.abbreviation, this.chapters});

  Map toJson() => {
      "title": title,
      "description" : description,
      "abbreviation" : abbreviation,
      "chapters" : chapters
    };
}