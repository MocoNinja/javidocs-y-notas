## Cheatsheet GREP

## Buscar recursivamente en un directorio, pero omitiendo algún subdirectorio de los resultados

* `grep -R "lo que quiero grepear" . --exclude-dir="la carpeta que no quiero que salga en los resultados`
* Ejemplo: en Java, no quiero que me saque los matches en target: `grep -R "EntityId" . --exclude-dir="\*target*"`

## No listar coincidencias en archivos binarios

Se hace mediante la flag: `-I`

Por ejemplo, parecido al ejemplo anterior en el que no queremos ver los binarios, los docs ni los logs en un wildfly al buscar algo:

`grep -IR "spring" --exclude-dir="\*log*" --exclude-dir="\*docs*" .`

## Mostrar líneas en el entorno del resultado

La flag `-A *num*` muestra `num` líneas por ***abajo***.

La flag `-B *num*` muestra `num` líneas por ***arriba***.

Ejemplo: `grep -B 5 -A 5 -R "div:nth-child(2)"`
