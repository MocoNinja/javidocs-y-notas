# Cheatsheet y Eecordatorios de Estructuras de Datos

## Mapas

### Evitar hacer un check explícito de si una clave existe para usar su valor actualizado

Pongamos que tenemos un mapa que tiene como clave un literal, y como valor un conteo de las ocurrencias de dicha clave.
Al inicializar el mapa como `Map<String, Integer> mapa # new HashMap<>();`, no tenemos ningún valor a 0, por lo que para comprobar las inserciones, tendríamos que implementar:

```java
if (mapa.get(key) == null) {
    mapa.put(key, 1);
} else {
    mapa.put(key, mapa.get(key) + 1);
}
```

Esto se puede hacer de forma mucho más concisa de la siguiente manera:

`mapa.merge(key, 1, Integer::sum);`

### Inicializar "inline" un HashMap

```java
Map<String, String> doubleBraceMap  # new HashMap<String, String>() {{
    put("key1", "value1");
    put("key2", "value2");
}};
```

https://www.baeldung.com/java-initialize-hashmap[Fuente y muchas maneras]
