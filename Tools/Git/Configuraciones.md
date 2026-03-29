# Configuraciones de git

## SSL

Hemos visto que ha habido un error en el que al intentar a acceder a un remoto, ha fallado por un error relativo a SSL.

El siguiente comando configura que se ignore el SSL y así ha funcionado:

```git config (--global) http.sslVerify "false"```

## File Mode

Trabajando en dos equipos distintos, he visto que al hacer un ```git status``` me listaban todos los ficheros como cambiados; al hacer un ```git diff```, estaba detectando un modo de fichero distinto.
Lo he solucionado haciendo, a nivel de proyecto:

```git config core.fileMode false```

[referencia](https://stackoverflow.com/questions/1580596/how-do-i-make-git-ignore-file-mode-chmod-changes)

## Line Endings

De forma análoga a lo anterior, para evitar los problemas derivados del salto de línea, se puede usar el siguiente comando:
```git config --global core.autocrlf true```

[referencia](http://stackoverflow.com/questions/20496084/ddg#20515071)
