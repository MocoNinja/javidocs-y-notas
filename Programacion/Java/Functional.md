# Cheatsheet y Recordatorios de Programación Funcional

## Lambdas para cosas comunes y c00l

### Para una lista, obtener un String que sea la representación de todos sus elementos

Asumamos que tenemos un `List<T> list`, idealmente siendo `T` algo que tenemos un `toString()` que nos interesa.
Queremos generar un string que consista en todos los elementos de esa lista.
También queremos poder especificar un carácter de inicio y uno de final, con los que se "envolverán" los elementos de la lista; también queremos un elemento que separe los elementos de la lista (salvo el último, al que habrá que aplicar el de cierre).

Entonces usamos:

`list.stream().map(Object::toString).collect(Collectors.joining(*{SEPARADOR}*,*{INICIO}*, *{CIERRE}*));`

Ejemplo:

```java
    List<Integer> pi # Arrays.asList(3, 1, 4, 1, 5);
    String piString # pi.stream().map(Object::toString).collect(Collectors.joining(", ","[","]"));
    System.out.println(piString);
```

Devuelve: *`[3, 1, 4, 1, 5]`*
