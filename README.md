# BibleText
Convierte un archivo de texto que contiene los capitulos de la biblia a formato Json.

```
Si deseas leer los textos y el avance, puedes entrar en la siguientes carpetas:
|
├───txt_original  (Texto original Valera 1602 Purificada)
└───txt_revisado  (Texto revisado Valera 1602 Purificada)
```

## Formato del archivo de texto
Este es el formato predefinido, se debe tener en cuenta los siguientes aspectos.

### 1. Cabeceras
Las cabeceras contienen información relevante del libro.

- **Título:** este contiene el título del libro.
- **Descripción:** información relevante del libro.
- **Abreviatura:** abreviatura del nombre del libro.

```
#title Génesis
#description Primer libro del Antiguo Testamento
#abbreviation Gn
```

### 2. Cuerpo
Esto son versículos de cada capitulo del libro. (recuerde no dejar lineas vacias despues del ultimo versiculo del capitulo).

- **Id:** este contiene el número del capítulo y del versículo separados por ':'.
- **Texto del versículo:** contenido del versículo.

```
1:1 EN el principio creó Dios el cielo y la tierra.
1:2 Y la tierra estaba sin forma y vacía, y las...
1:3 Y dijo Dios: Sea la luz: y fue la luz.
2:1 Y FUERON acabados los cielos y la tierra...
2:2 Y acabó Dios en el día séptimo su obra que...
2:3 Y bendijo Dios al día séptimo, y lo santificó...
3:1 EMPERO la serpiente era astuta, más que todos...
3:2 Y la mujer respondió a la serpiente: Del fruto...
3:3 Mas del fruto del árbol que está en medio del...
```

### 3. Como usar
Solo debe enviar como argumento la dirección o path del archivo de texto y este hará la conversión.

```
dart .\main.dart .\txt\gen.txt
```

### 4. Resultado
Obtendrás un archivo te tipo .json.

```json
{
    "title": "Génesis",
    "description": "Primer libro del Antiguo Testamento",
    "abbreviation": "Gn",
    "chapters": [
        {
            "number": 1,
            "verses": [
                {
                    "text": "EN el principio creó Dios el cielo y la tierra.",
                    "id": "1:1"
                },
                {
                    "text": "Y la tierra estaba sin forma y vacía, y las tinieblas estaban sobre la faz del abismo, y el Espíritu de Dios se movía sobre la faz de las aguas.",
                    "id": "1:2"
                },
```