# Trucos y comandos varios de *BASH*

## SHELL TRICKS

### Variable slicing

> ```{variable:indiceInicio(:numeroCaracteres)}```

Dada *```variable```*, retorna el substring desde *```indiceInicio```* hasta el fin de la cadena o, si se ha especificado, una cadena de longitud *```numeroCaracteres```*, empezando desde *```indiceInicio```*.

#### Ejemplos

> ```$> var=0123456789```
---
> ```$> echo ${var:0:1}```
\
*0*
\
> ```$> echo ${var:0:5}```
\
*01234*
\
> ```$> echo ${var:5:5}```
\
*56789*
\
> ```$> echo ${var:5:15}```
\
*56789*
\
> ```$> echo ${var:5}```
\
*56789*
\
> ```$> echo ${var:1}```
\
*123456789*
\
> ```$> echo ${var:0}```
\
*0123456789*

### Popurrí

* Longitud de una variable
  > ```${#variable}```
* Conversión numérica
  > ```$((BASE#NUMERO))```

## COMANDOS

### ```cut```

Es otra forma de obtener subporciones de un texto introducido, ya se de una sola palabra o de varios campos separados por un delimitador.
Tiene distintas opciones:

* ```-c```: Especifica el carácter (o rango de caracteres) a extraer. **El primer índice es 1**.
* ```-d```: Especifica el delimitador que separa los *campos*.
* ```-f```: Como ```-c```, pero tomando campos enteros en vez de carácteres individuales. **No** pueden usarse ambas opciones conjuntamente.

#### Ejemplos

> ```$> nombre="Pepe la rana"```
---
> ```$> echo $nombre | cut -c 2```
\
*e*
\
> ```$> echo $nombre | cut -c 2,10```
\
*ea*
\
> ```$> echo $nombre | cut -c 2-10```
\
*epe la ra*
\
> ```$> echo $nombre | cut -c 2-99```
\
*epe la rana*
\
> ```$> echo $nombre | cut -d " " -f 1,3```
\
*Pepe rana*
\
> ```$> echo $nombre | cut -d " " -f 1,3```
\
*Pepe la rana*
\
> ```$> echo $nombre | cut -d "e" -f 1```
\
*P*

### ```tr```

Es una utilidad para transformar el texto de un flujo de entrada a un flujo de salida.

El uso fundamental es:

>```tr (-opcion) CADENA1 (CADENA2)```

La opción por defecto es *translate*, que cambia todas las ocurrencias de *CADENA1* por *CADENA2*.
\
Tiene además diversas opciones:

* ```-s```: sustituye las repeticiones de *CADENA1* por **una instancia** de **CADENA2**
* ```-d```: borra las instancias de *CADENA1*
* ```-c```: Es el complementario a la opción por defecto; es decir cambia las ocurrencias **distintas** a *CADENA1* por *CADENA2*

En el **man**ual de tr (Linux), se especifican opciones:
>SETs are specified as strings of characters.  Most represent themselves.  Interpreted sequences are:

       \NNN   character with octal value NNN (1 to 3 octal digits)

       \\     backslash

       \a     audible BEL

       \b     backspace

       \f     form feed

       \n     new line

       \r     return

       \t     horizontal tab

       \v     vertical tab

       CHAR1-CHAR2
              all characters from CHAR1 to CHAR2 in ascending order

       [CHAR*]
              in SET2, copies of CHAR until length of SET1

       [CHAR*REPEAT]
              REPEAT copies of CHAR, REPEAT octal if starting with 0

       [:alnum:]
              all letters and digits

        [:alpha:]
              all letters

       [:blank:]
              all horizontal whitespace

       [:cntrl:]
              all control characters

       [:digit:]
              all digits

       [:graph:]
              all printable characters, not including space

       [:lower:]
              all lower case letters

       [:print:]
              all printable characters, including space

       [:punct:]
              all punctuation characters

       [:space:]
              all horizontal or vertical whitespace

       [:upper:]
              all upper case letters

       [:xdigit:]
              all hexadecimal digits

        [=CHAR=]
              all characters which are equivalent to CHAR

#### Ejemplos

> ```$> nombre="---Pepe la rana---"```
---
> ```$> echo $nombre | tr "a" "b"```
\
*---Pepe lb rbnb---*
---
> ```$> echo $nombre | tr -c "a" "b"```
\
*bbbbbbbbbabbababbbb*
---
> ```$> echo $nombre | tr -s "-" "*"``` &nbsp;&nbsp; y &nbsp;&nbsp; ```$> echo $nombre | tr -s "-" "**"```
\
*\*Pepe la rana\**
\
> ```$> echo $nombre | tr -s "a" "*"```
\
*---Pepe l\* r\*n\*---*
---
> ```$> echo $nombre | tr -d "a"```
\
*---Pepe l rn---*
---
> ```$> echo $nombre | tr "a" "b" | tr -d "-"```
\
*Pepe lb rbnb*
\
> ```$> echo $nombre | tr -d "[:punct:]" | tr "[:lower:]" "[:upper:]"```
\
*PEPE LA RANA*
---