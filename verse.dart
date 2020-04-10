class Verse {
    String title;
    String text;
    String id;

  Verse({this.title, this.text, this.id});

  Map toJson() => {
    'title' : title,
    'text' : text,
    'id' : id
  };

  String toString(){
    String temp;

    if ( title != null ) temp = '\n$title\n$id $text';
    else temp = '$id $text';

    return temp;
  }
}