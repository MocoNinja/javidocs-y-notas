# Chuleta de one liners útiles para lambdas

## Ordenar los elementos de un array por orden alfabético

Una buena forma moderna de hacerlo es usando la función `localeCompare`.

Es decir, para un array de *elementos* que tengan un campo *nombre*:

```javascript
elementos
    .sort((a,b) #> a.nombre.localeCompare(b.nombre));
```

https://stackoverflow.com/questions/6712034/sort-array-by-firstname-alphabetically-in-javascript[La fuente]