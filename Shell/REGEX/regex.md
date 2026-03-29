# Chuleta de Regex

## Matching en **palabras**

```shell
"\<REGEX\>
```

Ejemplo:

```shell
echo "Tres Teresas estresan tres tersas tigresas" | grep "\<tres\>"
```

> ```tres```

```shell
echo "Tres Teresas estresan tres tersas tigresas" | grep "\<[Tt]res\>"
```

> ```Tres tres```

## Matching de patrones

Si se quiere comprobar la repetición de cierto patrón, por ejemplo dos letras minúsculas seguidas, se siente la tentación de crear una expresión regular del estilo de:

```regex
"[a-z][a-z]"
```

Esto es incorrecto, ya que coincidirá con cualquier grupo de minúsculas, no sólo las que estén repetidas dos veces:

```regex
echo "ass" | grep "[a-z][a-z]"
```

> ```as```

Para especificar un patrón que se repita, hay que envolver dicho patrón **entre paréntesis**. Así, con el ejemplo anterior, se obtendría un patrón igual a:

```regex
"\([a-z]\)\1"
```

Donde ```\1``` indica el índice del patrón utilizado (pueden encadenarse 9 patrones```\([...]\)```) distintos

```regex
echo "ass" | grep "\([a-z]\)\1"
```

> ```ss```

Estas 9 'variables' permiten diversos usos. Por ejemplo, el siguiente *regex* permite encontrar palíndromos de 5 letras:

```regex
echo "tacocat missile" | grep "\([a-z]\)\([a-z]\)\([a-z]\)[a-z]\3\2\1"
````

> ```tacocat```

## Comandos aplicables a las expresiones

* ***Convertir a mayúsculas***: ```\U```
  * ***Parar***: ```\E```

## Referencias y *further reading*

* [Grymoire](http://www.grymoire.com/Unix/Regular.html)
* [Backrefering](https://www.regular-expressions.info/backref.html)
