import 'verse.dart';

class Chapter{
  int number;
  List<Verse> verses;

  Chapter({this.number, this.verses});

  Map toJson() => {
    "number" : number,
    "verses" : verses
  };
}