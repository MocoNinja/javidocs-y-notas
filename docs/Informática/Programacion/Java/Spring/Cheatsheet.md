# Cheatsheet SPRING

## Quiero poder cargar un archivo .properties

Aunque por defecto Spring *Boot* te carga el *`application.properties`* que está en la carpeta `resources`, podemos querer cargar otro o tener que trabajar con Spring sin el Boot.

Entonces, qué pasa si en cualquiera de estos dos casos quiero meter una propiedad de la forma:

```java
@Value(${prop.hostname})
private String hostname;
```

Siendo `prop.hostname` una propiedad que hemos metido en el fichero: `myprops.properties`.

Pues anotamos la clase donde queremos usar el `@Value` con:

`@PropertySource("classpath:myprops.properties")`

Notar que el classpath contiene directamente la estructura de `resources`, por lo que si tenemos:

`resources/props.properties`    -> `classpath:props.properties`

`resources/db/props.properties` -> `classpath:db/props.properties`

## Quiero arrancar desde CLI una aplicación especificando el puerto

`mvn spring-boot:run -Dspring-boot.run.arguments#--server.port#${EL_PUERTO}`
