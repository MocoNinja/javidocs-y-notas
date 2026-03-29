# Chuleta de sed

## Uso básico

### Remplazar un flujo

```shell
sed 's/PATRON/REMPLAZO/'
```

Busca la primera coincidencia, en cada línea, de ```PATRON``` en el flujo y la cambia por ```REMPLAZO```.

```/``` es el separador que suele usarse por defecto. Puede ser conveniente reemplazarlo cuando el patrón a modificar también lo contiene, ya que si no, se **requiere usar secuencias de escape**.
Por ejemplo:

```shell

sed 's/http:\/\/url.com/https:\/\/url.secure.com/

```

Es más conveniente usar otro separador, como por ejemplo:

```shell

sed 's#http://url.com#https://url.secure.com#'

```

### Usar un script

Cuando quieren usarse varias expresiones, es más conveniente escribirlas en un *script* (que no es más que un archivo de texto con las reglas) y pasarle al comando *sed* dichas reglas mediante la orden:

```shell

sed -f script fichero

```

Esto se puede ver en el **ejemplo 00**.


### Redirigir los cambios a ficheros en vez de a *STDOUT*

Al probar estos ejemplos, se puede ver que los cambios se muestran por consola (es decir, el *stdout* por defecto), por lo que los ficheros **no** se ven alterados. Para alterar el fichero original, se usa la opción:

```shell

sed -i script/regla fichero

```

Esto también se puede conseguir siemplemente con una redirección de la entrada, lo que también permite mover los cambios a un fichero nuevo, preservando el original sin cambios:

```shell

sed script/regla fichero > nuevoFichero

```

### Borrar

La opción más usada es ```'s/[...]/```, de ***s**ustitución*. sed permite más operaciones; borrar se consigue mediante:

```shell

sed 'd/[...]/'

```

## Rangos

Por defecto, sed recorre todo el flujo, línea a línea. Este comportamiento puede modificarse.

### Hacer que el remplazo se aplique a toda la lína

```shell

sed 's/PATRON/REMPLAZO/g'

```

### Aplicar a una línea concreta

Puede especificarse una línea concreta de la siguiente manera:

```shell

sed 's/[...]/LINEA

```

Hay que tene en cuenta que las opciones **pueden combinarse**. Por ejemplo, puede ejecutarse sed desde una línea hasta el final del fichero combinando un número y la opción ```/g```

Por ejemplo, los siguientes comandos:

```shell

 echo "PalabraUno PalabraDos PalabraTres" | sed 's/[a-zA-Z0-9]*//2'

 echo "PalabraUno PalabraDos PalabraTres" | sed 's/[a-zA-Z0-9]*//2g'

```

Resultan respectivamente en:

 > ```PalabraUno  PalabraTres```
\
\
 > ```PalabraUno```

Esto parece **NO** funcionar en scripts. Es por ello que hay que usar otra sintaxis, y especificar el rango **antes** de la expresión. Estas líneas quedan entonces:

```shell

sed 'linea [EXPRESIÓN]'

```

```shell

sed 'lineaInicio,lineaFin [EXPRESIÓN]'

```

Donde existen carácteres especiales. Por ejemplo, el *final del fichero* es equivalente a ```$```. De esta manera, el comando anterior ```sed 's/[a-zA-Z0-9]*//2g'``` pasaría a ser ```sed '2,$ s/[a-zA-Z0-9]*//'```

Esto puede verse mejor en los **ejemplos**, carpeta *02*.

### Remplazo de patrones

Se puede especificar un patrón patrón por el que filtrar. Este patrón:

* *Por defecto*, **debe** ir entre ```/```
* Puede especificarse otro carácter, **escapándolo mediante ```\```**

Esto puede verse en los *Code Examples* de sed adjuntos.

## Match de patrones

### Referenciar el patrón encontrado

Es común querer actuar sobre los matches que ha encontrado el patrón buscado. Esto se conisgue mediante el carácter especial ```&```.

Por ejemplo, asumamos que tenemos un string aleatorio como "Tres tristes tigres" y queremos remplazar las vocales encontradas y ponerlas entre paréntesis. Esto se puede conseguir mediante la siguiente instrucción:

```shell

sed 'e/[aeiou]/(&)/g'

```

Entonces el comando:
> ```echo "Tres tristes tigres" | sed 's/[aeiou]/(&)/g'```

Resulta en la salida:
> ```Tr(e)s tr(i)st(e)s t(i)gr(e)s```

### Uso de expresiones regular expandidas

Algunas opciones típicas de las expresiones regulares, como podría ser ```[0-9]+``` en vez de ```[0-9][0-9]*``` para asegurar la presencia de al menos un número en la expresión.

**En LINUX**, la llamada a ```sed``` teniendo en cuenta estas expresiones se realiza con la opción:

```sed -r '[...]'```

## Trucos recopilados de sed

### Incorporar un salto de línea en el remplazo

En general, se puede instruir a ```sed``` a realizar la sustitución de los carácteres especiales (```\n```, ```\t```...) mediante el símbolo ```$```.

Así tendríamos la siguiente expresión válida:

> ```sed 's/regexp/\'$'\n/g'```

Notar que también sería válido:

> ```sed 's/regexp/\\\n/g'```

## Referencias y *further reading*

* [GRYMOIRE SED](http://www.grymoire.com/Unix/sed.html)
* [GRYMOIRE REGEX](http://www.grymoire.com/Unix/Regular.html)
