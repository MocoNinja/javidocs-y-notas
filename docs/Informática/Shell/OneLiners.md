# One-liners para shell UNIX

## Matar un proceso que está escuchando en un puerto

```sudo kill -9 $(sudo netstat -putana | grep 8083 | grep -Po "[0-9]+/java" | cut -d "/" -f1)```

## Lo de antes pero sin sacar por consola errores

```sudo kill -9 $(sudo netstat -putana | grep 8083 | grep -Po "[0-9]+/java" | cut -d "/" -f1) > /dev/null 2>&1 || echo "NOEXISTE --> NO SE MATA NADA"```

## Borrar ficheros con _`<X>`_ días de antigüedad

```find </path/to/directory/ficheros> -mtime +<X> -delete```

## Decodificar ROTT13

```echo "Rkcybvg Fuvg" | tr '[A-Za-z]' '[N-ZA-Mn-za-m]'```

## Encontrar ficheros sin extensión

```find . -type f ! -name '*.*'```

## Renombrar ficheros sin extensión para darles extensión (`mkv`, por ejemplo)

```find . -type f ! -name '*.*' -exec mv {} {}.mkv \;```
