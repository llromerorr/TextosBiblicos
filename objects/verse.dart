class Verse {
    String text;
    String id;

  Verse({this.text, this.id});

  Map toJson() => {
    'text' : text,
    'id' : id
  };

  String toString() => '$id $text';
}