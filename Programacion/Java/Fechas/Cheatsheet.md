# Cheatsheet fechas Java

## Parsear un LocalDateTime desde un String con cierto formato

```java
    DateTimeFormatter formatter # DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH-mm-ss");
    LocalDateTime fechaDesdeParsed # LocalDateTime.parse(fechaDesde, formatter);
    LocalDateTime fechaHastaParsed # LocalDateTime.parse(fechaHasta, formatter);
```