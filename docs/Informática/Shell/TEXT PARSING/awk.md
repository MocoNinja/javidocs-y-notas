# Apuntes de awk

## Descripción general y modelo

Un programa de awk consiste en un ***loop principal***, que se ejecutará mientras existan líneas por leer, terminándose cuando ya no haya ninguna línea de entrada más. Además de este *loop*, se *permiten* dos procedimientos adicionales: **BEGIN**, que se ejecutará *antes* de leer ninguna línea; y **AFTER**, que se ejecutará cuando se hayan leído *todas* las líneas del fichero.

El flujo general de ejecución de awk consiste en leer línea a línea el fichero, dejándo estas disponibles para el procesamiento en el loop principal. Cuando se lee una línea, se comparan con un patrón. Las líneas que cumplen el patrón especificado, son entonces **objetos de una acción**.

Las instrucciones tienen la siguiente forma:

```awk
/regex del patron/ { acción }
```

Donde por defecto, ```accion``` es ```print```. Por defecto, se pueden usar características del *regex expandido, tales como ```[...]+```.
Para salidas con formato, puede usarse [printf](https://docstore.mik.ua/orelly/unix3/sedawk/ch07_09.htm)

## Registros y campos

Awk asumes que la entrada es **estructurada**. En los casos más simples, las líneas de entrada se consideran un **registro**; en estos *registros*, las palabras serían los **campos**. Estos campos están separados por un **delimitador**. Este *delimitiador* es por defecto un *espacio* o un *tabulador* (o una agrupación de varios seguidos).

Este texto se puede referenciar mediante el operador ```$```.

*```$0```* hace referencia al **registro completo**, mientras que los *n* **campos** ordenados se pueden obtener mediante *```$n```*.

De esta manera:

```shell
  echo "Tres tristes tigres" | awk '{print $1, $3}'
```

Resulta en:

> "Tres tigres"

Notar que la *coma* resulta por defecto en un **espacio**. Este es el *separador del campo de salida* y puede cambiarse.

Otro aspecto a tener en cuenta que **cualquier expresión que evalúe a un entero** puede usarse para *refenciar un campo*. Es por ello que la salida anterior también puede conseguirse con la siguiente expresión:

```shell
  echo "Tres tristes tigres" | awk 'BEGIN { uno = 1; dos = 2 } {print $(uno), $(uno + dos)}'
```

### Separadores

Como hemos dicho, por defecto, el campo separador consiste en *espacios* **y** *tabuladores*. Puede especificarse otro de diversas maneras.

* *Al llamar al programa*, mediante la opción ```-F```. Ejemplos:
  * ```awk -F"\t" [...]```, que separaría por *tabuladores*
  * ```awk -F, [...]```, que separaría por *comas*
* *Dentro del script*, mediante la **variable del sistema *FS***
  * ```BEGIN { FS = "," }```

Pueden especificarse varios carácteres como separadores, que se interpretarán como una expresión regular. Por ejemplo, ```FS = "[':\t]"```, separará por cada uno de los carácteres entre los corchetes. Estos separadores suelen indicarse antes del script, en la parte de ```BEGIN```, aunque pueden redefinirse a lo largo del script.

### Filtros

Antes se ha explicado que lo usual es comparar las líneas con **patrones**. El ejemplo dado era un patrón *global*. Este patrón también puede aplicase a *campos* específicos:

* ```$5 ~ /MA/   { print [...]}```, testea la **presencia** de *MA* en el **quinto campo**
* ```$6 !~ /MA/   { print [...]}```, testea la **ausencia** de *MA* en el **sexto campo**

Para controlar una acción, en vez de patrones también pueden usarse **expresiones relacionales**.

Por ejemplo, para aplicar la acción sólo a los registros con 5 campos, se usaría:

```shell
  NF == 5
```

## Expresiones

A diferencia de sed, awk es un lenguaje de programación, porque permite el uso de **expresiones**, con *constantes*, *variables*, *operadores*, *funciones* y *expresiones regulares*.

### Constantes

Hay dos tipos de constantes: **strings** y **numéricas**.
Los *strings* deben estar entrecomillados y pueden contener [secuencias de escape](https://docstore.mik.ua/orelly/unix3/sedawk/ch07_06.htm#sedawk-ch-7-tab-1).

### Variables

Al igual que las constantes, son de tipo **strings** y **numéricas**. Son *case sensitive*, no se declaran ni inicializan y todas tienen **un valor de cada tipo**, usando awk el adecuado de forma automática (El valor predeterminado de cadena es ```""``` y el numérico es ```0```). Las expresiones de uso son las habituales, con ejemplo ```x = 3``` y ```nombre = "Pepe la rana"```. Hay varios operadores:

* [Aritméticos](https://docstore.mik.ua/orelly/unix3/sedawk/ch07_06.htm#sedawk-ch-7-tab-2)
* [De asignación](https://docstore.mik.ua/orelly/unix3/sedawk/ch07_06.htm#sedawk-ch-7-tab-3)
* [Lógicos](https://docstore.mik.ua/orelly/unix3/sedawk/ch07_08.htm#sedawk-ch-7-tab-5) y [relacionales](https://docstore.mik.ua/orelly/unix3/sedawk/ch07_08.htm#sedawk-ch-7-tab-4)
* Concatenación de strings: mediante **un espacio**

#### Variables del sistema

Existen uns variables definidas por awk. Pueden ser de dos tipos. Unas tienen valores cuyos valores por defecto pueden ser cambiados, como podrían ser los separadores; las otras definen valores que pueden usarse en *reports* o al *procesar*, como podrían ser el número de campos presentes en el registro actual, el número de registro, etc... Estas últimas son **actualizadas por awk de forma automática**.

* **FS**, ***F**ield **S**eparator*: Por defecto es un espacio, lo que awk interpreta como cualquier número de espacios y tabulaciones.
* **NF**, ***N**umber of **F**ields*: Número de campos del registro actual. Modificar su valor tiene efectos secundarios.
* **RS**, ***R**ecord **S**eparator*: Es el carácter que separa los registros; por defecto, es un salto de línea. Es la única variable de awk en la que sólo se presta atención al primer carácter del valor.
* **FILENAME**: Contiene el nombre del fichero de la entrada actual.
* **FNR**, ***F**ilename **N**umber of current **R**record*: Es la referencia al número de registro relativo al fichero de entrada actual; es útil cuando se trabaja con varios ficheros de entrada.
* **OFS**, ***O**utput **F**ile **S**eparator*: Es el carácter que separa los campos de salida

### Arrays

En awk hay arrays que permiten almacenar un conjunto de valores. La sintaxis de uso es análoga a **C**, accediendo a los elementos del array mediante su índice entre corchetes. Estos arrays son **asociativos**, debido a que los índices son realmente de tipo **string**, aunque sean numéricos.

Finalmente destacar la existencia del bucle ***for each***, que tiene el funcionamiento análogo que cabría esperar si se conoce de otros lenguajes.

La sintaxis es:

```awk
for (variable in array)
  [...]array[variable][...]
```

## Flujo de ejecución

### If/Else

Se puede controlar el cumplimiento de condiciones mediante *if/else*. Se pueden aplicar condiciones de comparación, por ejemplo ```if (status == "CLOSED")``` o con patrones, ```if (answer ~ /[yY](ES)?/```. Si una rama de ejecución tiene más de una instrucción, **deben** usarse ```{}```.
También puede usarse la forma ternaria del operador:

```shell
    expresion ? siCierto : siFalso
    nota = (media >= 5) ? "Aprobado" : "Suspenso"
```

### Loops

Awk puede hacer uso de los bucles **```while```, ```do while``` y ```for```**.

La sintáxis es la usual (idéntica a **C**), requiriendo también de *braces* si hay más de una instrucción.

También de la forma usual, están las órdenes de **```break``` y ```continue```, que tienen su mismo uso: si se cumple la condición en un bucle, *break* terminará el bucle de forma prematura, mientras que *continue* pasará a la siguiente iteración del bucle, pero ignorando las órdenes restantes en la iteración actual.

### Main

El bucle principal puede ver alterado su flujo de ejecución mediante las órdenes **```next``` y ```exit```**.
**exit** termina el programa, pasando a *END*. **next** sigue leyendo las líneas del fichero, ignorando órdenes.


## Referencias y *further reading*

* [sed&awk, 2nd Ed. O'Reilly](https://docstore.mik.ua/orelly/unix3/sedawk/)
* [Overview general](https://likegeeks.com/awk-command/)
