# bible-to-jsom
Convertir archivo de texto que contiene la biblia a formato Json.

## Formato del archivo de texto
Este es el formato predefinido, se debe tener en cuenta los siguientes aspectos.

### 1. Cabeceras
Las cabeceras contienen información relevante del libro.

- Titulo: este contiene el titulo del libro.
- Descripción: información relevante del libro.
- Abreviatura: abreviatura del nombre del libro.

```
#title Génesis
#description Primer libro del Antiguo Testamento
#abbreviation Gn
```

### 2. Cuerpo
Esto son los libros y versículos de cada libro.

- Id: este contiene el numero del capitulo y del versiculo separados por ':'.
- Texto del versículo: contenido del versículo.

```
1:1 EN el principio creó Dios el cielo y la tierra.
1:2 Y la tierra estaba sin forma y vacía, y las...
1:3 Y dijo Dios: Sea la luz: y fue la luz.
2:1 Y FUERON acabados los cie¬los y la tierra...
2:2 Y acabó Dios en el día séptimo su obra que...
2:3 Y bendijo Dios al día séptimo, y santificólo...
3:1 EMPERO la serpiente era astuta, más que todos...
3:2 Y la mujer respondió a la ser¬piente: Del fruto...
3:3 Mas del fruto del árbol que está en medio del...
```

### 3. Como usar
Solo debe enviar como argumento la direccion o path del archivo de texto y este hara la conversion.

```
dart .\main.dart .\txt\gen.txt
```