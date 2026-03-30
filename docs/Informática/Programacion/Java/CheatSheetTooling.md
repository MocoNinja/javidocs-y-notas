# Cheatsheet sobre tooling / devops Java

## Arrancar aplicación de Spring Boot en modo depuración con el Eclipse y con parámetros personalizados

1. Lanzar la aplicación con el siguiente comando:

```mvn spring-boot:run -DENTORNO=DEV -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005 -DENTORNO=DEV"```

Nota: parece que esto también funciona: 

```mvn spring-boot:run -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005 -DENTORNO=DEV"```

> Donde ```address=5005``` es el puerto donde se va a poder attachear el Eclipse y ```-DENTORNO=DEV``` es el parámetro personalizado que queremos usar.

2. Arrancar el Eclipse, crear una nueva ***Debug Configuration***, de tipo ***Remote Java Application***. Ahí, especificar el puerto [en este caso, 5005] y lanzar.

## Especificar una jvm específica para correr el Eclipse

Modificar el eclipse.ini y añadir la siguiente configuraciòn:

```text
 -vm
*PathToTheVm*
-vmargs
```
