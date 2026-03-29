# Cheatsheet de apt

## Borrar una key que hemos aceptado

Muchas veces tenemos que aceptar una key con un `sudo apt-key add _..._`.
Cuando queremos revertir esta acción:

* Listamos las claves con: `sudo apt-key list`
* De la información que nos da, buscamos la línea que corresponde a algo parecido a `XXXX YYYY ZZZZ ...` (un troncho de números hex) de la clave que queremos reventar
* Con ese troncho pegado, hacemos: `sudo apt-key del "_el troncho_"`

Y ya estaría...

## Mostrar el nombre completo del paquete en la versión deseada

`apt-cache showpkg _nombre_`

## Instalar el paquete en una versión (la del comando anterior)

`apt-get install _paquete#version_`
