# Lecciones aprendidas / trucos de Java

## Me falla al hacer un split con ciertos carácters

Tengo: ```String mystring = "hola1|hola2"```

Quiero: ```String[] partes = mystring.split("|")```

Espero: ```partes === {"hola1", "hola2"}```

Aún así obtengo un array con cada letra. Esto es porque el split funciona con una ***RegExp***, por lo que no está usando el carácter especificado sino una expresión (lo mismo pasaría con otros carácteres especiales, como un ".").

La solución es usar el siguiente código: ```String[] partes = mystring.split("\\|")```
