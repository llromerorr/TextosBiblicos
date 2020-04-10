import 'dart:convert';
import 'dart:io';
import 'chapter.dart';
import 'verse.dart';
import 'book.dart';

// Variables
String storedTitle = null;
String libroEnString = '';
List<String> libroEnLineas = List<String>();
List<Verse> listaDeVersos = List<Verse>();
File output = null;
String title = '';
String abbreviation = '';
String description = '';
Book libro = Book();


void main(List<String> args) async {
  // Verificar si no se ha enviado argumentos
  if(args.length == 0){
    print('[Error 001] falta el path del archivo\n');
    return null;
  }

  // Inicializar variables
  libroEnString = await File(args[0]).readAsString();
  libroEnLineas = libroEnString.split('\n');

  // Establecer titulo, abreviacion y descripcion
  setHeaders();

  // Separar por LINEAS el documento
  for(var verse in libroEnLineas){
    Verse temp = checkLine(data: verse, book_name: abbreviation); // Procesar la linea

    if(temp != null) // Omitir si la linea es NULL
      listaDeVersos.add(temp);
  }
  
  //Crear libro
  crearLibro(listaDeVersos);
  
  // Crear archivo output.json
  output = File('$abbreviation.json');
  output.create();
  output.writeAsString(jsonEncode(libro).replaceAll('\\r', ''));

  // Show output text
  print('Libro $title ha sido creado como $abbreviation.json.');
}


Verse checkLine({String data, String book_name}){
  if(data.length == 0)
    return null;

  final lista_verse = data.split(' ');
  final verso = Verse();

  if(lista_verse[0] == book_name){
    verso.id = lista_verse[0] + ' ' + lista_verse[1];
    
    if(storedTitle != null)
    {
      verso.title = storedTitle;
      storedTitle = null;
    }
    else
      verso.title = null;

    verso.text = '';

    for(var i = 2; i < lista_verse.length; i++){
      verso.text += '${lista_verse[i].trim()} ';
    }

    verso.text = verso.text.trim();
  }

  else{
    storedTitle = data;
    return null;
  }

  return verso;
}

void setHeaders(){
    for(int i = 0; i < 3; i++){
      List<String> split = libroEnLineas[i].split(' ');

      switch (split[0]) {
        case '#title':
          for(int j = 1; j < split.length; j++)
            title += split[j] + ' ';

          title = title.trim().substring(0, title.length - 2);
          break;

          case '#description':
            for(int j = 1; j < split.length; j++)
              description += split[j] + ' ';

            description = description.trim().substring(0, description.length - 2);
            break;

          case '#abbreviation':
            for(int j = 1; j < split.length; j++)
              abbreviation += split[j] + ' ';

            abbreviation = abbreviation.trim().substring(0, abbreviation.length - 2);
            break;
          
        default:
          print('[Error 002] verifique parametros:\n\n#title\n#description\n#abbreviation.\n');
      }
  }
}

void crearLibro(List<Verse> listaDeVersos){
  int actualChapter = 0;
  
  libro.title = title;
  libro.description = description;
  libro.abbreviation = abbreviation;
  libro.chapters = List<Chapter>();
  libro.chapters.add(Chapter(number: actualChapter + 1));
  libro.chapters[actualChapter].verses = List<Verse>();

  for(var verse in listaDeVersos){
    if(getChapterAndVerse(verse.id)['chapter'] == actualChapter + 1){
      libro.chapters[actualChapter].verses.add(verse);
    }
    else{
      actualChapter++;
      libro.chapters.add(Chapter(number: actualChapter + 1));
      libro.chapters[actualChapter].verses = List<Verse>();
      libro.chapters[actualChapter].verses.add(verse);
    }
  }
}

Map<String, int> getChapterAndVerse(String id){
  int chapter = null;
  int verse = null;
  
  try { 
    chapter = int.parse(id.split(' ')[1].split(':')[0]);
    verse = int.parse(id.split(' ')[1].split(':')[1]);
  }
  
  catch (e) { print('[Error 003] el ID: $id esta mal.'); }
  
  return {
    "chapter": chapter,
    "verse": verse
  };
} 