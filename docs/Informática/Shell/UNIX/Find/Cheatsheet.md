# Cheatsheet FIND

## Omitir un directorio de la búsqueda

Se le pasa la flag `-not` y el argumento `-directory _${lo que queremos ignorar}_`

Ejemplo: buscar archivos properties de Java, que no estén en el _target_:

`find . -name "\*.properties" -not -path "*/target/*"`